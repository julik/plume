SELECT count(*)
      FROM t1, json_tree(j0) AS rt
     WHERE rt.type NOT IN ('object','array')
       AND rt.atom IS NOT (j0 ->> rt.fullkey);
