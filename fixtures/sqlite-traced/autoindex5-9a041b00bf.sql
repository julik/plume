CREATE TABLE source_packages
              (name TEXT NOT NULL,
              release TEXT NOT NULL,
              subrelease TEXT NOT NULL,
              archive TEXT NOT NULL,
              version TEXT NOT NULL,
              version_id INTEGER NOT NULL DEFAULT 0,
              PRIMARY KEY (name, release, subrelease, archive));
