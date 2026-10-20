CREATE TABLE bugs
          (name TEXT NOT NULL PRIMARY KEY,
           cve_status TEXT NOT NULL
               CHECK (cve_status IN
                      ('', 'CANDIDATE', 'ASSIGNED', 'RESERVED', 'REJECTED')),
           not_for_us INTEGER NOT NULL CHECK (not_for_us IN (0, 1)),
           description TEXT NOT NULL,
           release_date TEXT NOT NULL,
           source_file TEXT NOT NULL,
           source_line INTEGER NOT NULL);
