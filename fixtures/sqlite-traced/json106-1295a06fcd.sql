SELECT count(*)
      FROM t1, kv
     WHERE key NOT LIKE '%]'
       AND json_remove(j5,key)->>key IS NOT NULL
