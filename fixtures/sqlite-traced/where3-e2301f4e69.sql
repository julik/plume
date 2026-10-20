CREATE TABLE aaa (id INTEGER PRIMARY KEY, type INTEGER,
                    fk INTEGER DEFAULT NULL, parent INTEGER,
                    position INTEGER, title LONGVARCHAR,
                    keyword_id INTEGER, folder_type TEXT,
                    dateAdded INTEGER, lastModified INTEGER);
