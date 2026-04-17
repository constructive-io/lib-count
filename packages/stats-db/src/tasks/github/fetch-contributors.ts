import { Octokit } from "@octokit/rest";
import { createOctokitClient, makeApiCall, waitForRateLimit } from "./octokit-client";
import { Client } from "pg";

export interface ContributorData {
  id: number;
  login: string;
  name: string | null;
  email: string | null;
  avatar_url: string;
  organizations: {
    id: number;
    login: string;
    description: string | null;
    avatar_url: string;
  }[];
}

export async function fetchRepoContributors(
  octokit: Octokit,
  owner: string,
  repo: string
): Promise<ContributorData[]> {
  const contributorsData: ContributorData[] = [];
  
  // 1. Get contributors for repo
  await waitForRateLimit(octokit, "core");
  const contributors = await makeApiCall(octokit, () =>
    octokit.rest.repos.listContributors({
      owner,
      repo,
      per_page: 100
    })
  );

  for (const contrib of contributors.data) {
    if (contrib.type === "Bot" || !contrib.login) continue;

    await waitForRateLimit(octokit, "core");
    // 2. Get user details (for email and name)
    const userDetail = await makeApiCall(octokit, () =>
      octokit.rest.users.getByUsername({
        username: contrib.login as string
      })
    );

    await waitForRateLimit(octokit, "core");
    // 3. Get user's orgs
    const userOrgs = await makeApiCall(octokit, () =>
      octokit.rest.orgs.listForUser({
        username: contrib.login as string
      })
    );

    contributorsData.push({
      id: userDetail.data.id,
      login: userDetail.data.login,
      name: userDetail.data.name || null,
      email: userDetail.data.email || null,
      avatar_url: userDetail.data.avatar_url,
      organizations: userOrgs.data.map(org => ({
        id: org.id,
        login: org.login,
        description: org.description || null,
        avatar_url: org.avatar_url
      }))
    });
  }

  return contributorsData;
}

export async function saveContributorData(
  pgClient: Client,
  contributors: ContributorData[]
) {
  for (const c of contributors) {
    // 1. Insert/Update Contributor
    const cRes = await pgClient.query(
      `
      INSERT INTO github.contributor (github_id, login, name, avatar_url)
      VALUES ($1, $2, $3, $4)
      ON CONFLICT (github_id) DO UPDATE SET
        login = EXCLUDED.login,
        name = EXCLUDED.name,
        avatar_url = EXCLUDED.avatar_url,
        updated_at = CURRENT_TIMESTAMP
      RETURNING id;
      `,
      [c.id, c.login, c.name, c.avatar_url]
    );
    const contributorId = cRes.rows[0].id;

    // 2. Insert/Update Email
    if (c.email) {
      await pgClient.query(
        `
        INSERT INTO github.contributor_email (contributor_id, email, is_public)
        VALUES ($1, $2, true)
        ON CONFLICT (contributor_id, email) DO UPDATE SET
          updated_at = CURRENT_TIMESTAMP;
        `,
        [contributorId, c.email]
      );
    }

    // 3. Insert/Update Organizations
    for (const org of c.organizations) {
      // First ensure the org exists in github.organization (if we don't have it)
      const orgRes = await pgClient.query(
        `
        INSERT INTO github.organization (github_id, login, description, avatar_url)
        VALUES ($1, $2, $3, $4)
        ON CONFLICT (github_id) DO UPDATE SET
          login = EXCLUDED.login,
          description = EXCLUDED.description,
          avatar_url = EXCLUDED.avatar_url,
          updated_at = CURRENT_TIMESTAMP
        RETURNING id;
        `,
        [org.id, org.login, org.description, org.avatar_url]
      );
      const organizationId = orgRes.rows[0].id;

      // Link contributor to organization
      await pgClient.query(
        `
        INSERT INTO github.contributor_organization (contributor_id, organization_id)
        VALUES ($1, $2)
        ON CONFLICT (contributor_id, organization_id) DO UPDATE SET
          updated_at = CURRENT_TIMESTAMP;
        `,
        [contributorId, organizationId]
      );
    }
  }
}

// Test function (can be executed directly)
async function runTest() {
  const token = process.env.GITHUB_TOKEN;
  if (!token) {
    console.log("Mocking test since GITHUB_TOKEN is not set.");
    // Mock run
    console.log("Would fetch from hyperweb-io/cosmo-kit...");
    return;
  }

  console.log("Testing against hyperweb-io/cosmo-kit...");
  const octokit = createOctokitClient(token);
  const data = await fetchRepoContributors(octokit, "hyperweb-io", "cosmo-kit");
  console.log("Fetched Contributors:", JSON.stringify(data, null, 2));

  // Note: pgClient saving would happen here if a DB connection was set up.
}

if (require.main === module) {
  runTest().catch(console.error);
}
