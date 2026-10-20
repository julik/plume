CREATE TABLE package_notes
          (id INTEGER NOT NULL PRIMARY KEY,
           bug_name TEXT NOT NULL,
           package TEXT NOT NULL,
           fixed_version TEXT
               CHECK (fixed_version IS NULL OR fixed_version <> ''),
           fixed_version_id INTEGER NOT NULL DEFAULT 0,
           release TEXT NOT NULL,
           package_kind TEXT NOT NULL DEFAULT 'unknown',
           urgency TEXT NOT NULL,
           bug_origin TEXT NOT NULL DEFAULT '');
