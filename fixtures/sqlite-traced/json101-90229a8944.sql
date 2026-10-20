SELECT j2.rowid, jx.rowid, fullkey, path, key
    FROM j2, json_each(j2.json) AS jx
   WHERE jx.value<>jx.atom AND type NOT IN ('array','object');
