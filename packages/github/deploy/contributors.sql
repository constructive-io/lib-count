-- Deploy: github:contributors

CREATE TABLE github.contributor (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    github_id bigint UNIQUE NOT NULL,
    login text NOT NULL,
    name text,
    avatar_url text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE github.contributor_email (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    contributor_id uuid NOT NULL REFERENCES github.contributor(id),
    email text NOT NULL,
    is_public boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (contributor_id, email)
);

CREATE TABLE github.contributor_organization (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    contributor_id uuid NOT NULL REFERENCES github.contributor(id),
    organization_id uuid NOT NULL REFERENCES github.organization(id),
    role text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (contributor_id, organization_id)
);

CREATE TRIGGER update_contributor_timestamp
    BEFORE UPDATE ON github.contributor
    FOR EACH ROW
    EXECUTE FUNCTION github.update_updated_at();

CREATE TRIGGER update_contributor_email_timestamp
    BEFORE UPDATE ON github.contributor_email
    FOR EACH ROW
    EXECUTE FUNCTION github.update_updated_at();

CREATE TRIGGER update_contributor_organization_timestamp
    BEFORE UPDATE ON github.contributor_organization
    FOR EACH ROW
    EXECUTE FUNCTION github.update_updated_at();
