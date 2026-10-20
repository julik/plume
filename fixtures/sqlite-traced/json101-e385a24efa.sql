SELECT j2.rowid, jx.rowid, fullkey, path, key
    FROM j2, json_tree(j2.json) AS jx
   WHERE fullkey!=(path || CASE WHEN typeof(key)=='integer' THEN '['||key||']'
                                ELSE '.'||key END);
