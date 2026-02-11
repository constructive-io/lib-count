\echo Use "CREATE EXTENSION npm" to load this file. \quit
CREATE SCHEMA npm_count;

CREATE TABLE npm_count.npm_package (
  package_name text PRIMARY KEY,
  creation_date date NOT NULL,
  last_publish_date date NOT NULL,
  last_fetched_date date,
  is_active boolean DEFAULT true,
  updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE npm_count.daily_downloads (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  package_name text NOT NULL,
  date date NOT NULL,
  download_count bigint NOT NULL,
  created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_package_date 
    UNIQUE (package_name, date),
  FOREIGN KEY(package_name)
    REFERENCES npm_count.npm_package (package_name)
);

CREATE TABLE npm_count.category (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  name text NOT NULL UNIQUE,
  description text,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
);

CREATE TABLE npm_count.package_category (
  package_id text REFERENCES npm_count.npm_package (package_name)
    ON DELETE CASCADE,
  category_id uuid REFERENCES npm_count.category (id)
    ON DELETE CASCADE,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  PRIMARY KEY (package_id, category_id)
);

CREATE FUNCTION npm_count.validate_download_date() RETURNS trigger AS $EOFCODE$
BEGIN
    -- Allow downloads up to 7 days before creation date to handle npm data inconsistencies
    IF NEW.date < (
        SELECT creation_date - interval '7 days'
        FROM npm_count.npm_package 
        WHERE package_name = NEW.package_name
    ) THEN
        RAISE EXCEPTION 'Download date is too far before package creation date (7 day grace period)';
    END IF;
    RETURN NEW;
END;
$EOFCODE$ LANGUAGE plpgsql;

CREATE FUNCTION npm_count.set_id_from_pkg_date() RETURNS trigger AS $EOFCODE$
BEGIN
    NEW.id := uuid_generate_v5(
        '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 
        NEW.package_name || NEW.date::text
    );
    RETURN NEW;
END;
$EOFCODE$ LANGUAGE plpgsql;

CREATE FUNCTION npm_count.update_updated_at() RETURNS trigger AS $EOFCODE$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$EOFCODE$ LANGUAGE plpgsql;

CREATE TRIGGER validate_download_date
  BEFORE INSERT OR UPDATE
  ON npm_count.daily_downloads
  FOR EACH ROW
  EXECUTE PROCEDURE npm_count.validate_download_date();

CREATE TRIGGER before_insert_daily_downloads
  BEFORE INSERT
  ON npm_count.daily_downloads
  FOR EACH ROW
  EXECUTE PROCEDURE npm_count.set_id_from_pkg_date();

CREATE TRIGGER update_npm_package_timestamp
  BEFORE UPDATE
  ON npm_count.npm_package
  FOR EACH ROW
  EXECUTE PROCEDURE npm_count.update_updated_at();

CREATE INDEX idx_daily_downloads_package_name ON npm_count.daily_downloads (package_name);

CREATE INDEX idx_daily_downloads_date ON npm_count.daily_downloads (date);

CREATE INDEX idx_daily_downloads_package_date ON npm_count.daily_downloads (package_name, date);

CREATE INDEX idx_daily_downloads_package_date_range ON npm_count.daily_downloads (package_name, date DESC);

CREATE INDEX idx_package_category_package ON npm_count.package_category (package_id);

CREATE INDEX idx_package_category_category ON npm_count.package_category (category_id);

COMMENT ON TABLE npm_count.daily_downloads IS 'Daily download statistics for npm packages';

COMMENT ON TABLE npm_count.npm_package IS 'NPM package metadata and tracking information';

CREATE VIEW npm_count.missing_download_dates AS WITH RECURSIVE 
  date_series AS (SELECT
    p.package_name,
    p.creation_date::date AS start_date,
    CAST(COALESCE(p.last_fetched_date, CURRENT_DATE) AS date) AS end_date
  FROM npm_count.npm_package AS p
  WHERE
    p.is_active = true),
  all_dates AS (SELECT
    package_name,
    start_date::date AS date
  FROM date_series
  UNION
  ALL
  SELECT
    package_name,
    CAST(date + '1 day'::interval AS date)
  FROM all_dates AS a
  WHERE
    date < ((SELECT end_date
  FROM date_series AS d
  WHERE
    d.package_name = a.package_name)))
SELECT
  a.package_name,
  a.date AS missing_date
FROM all_dates AS a
LEFT JOIN npm_count.daily_downloads AS d ON
  a.package_name = d.package_name
    AND a.date = d.date
WHERE
  d.package_name IS NULL
  AND a.date <= CURRENT_DATE;