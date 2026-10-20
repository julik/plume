SELECT x.*, '|'
      FROM sqlite_schema, pragma_foreign_key_check(name) AS x
      WHERE type='table'
      ORDER BY x."table";
