INSERT INTO kv
      SELECT rt.rowid, rt.fullkey, rt.atom
        FROM t1, json_tree(j0) AS rt
       WHERE rt.type NOT IN ('object','array');
