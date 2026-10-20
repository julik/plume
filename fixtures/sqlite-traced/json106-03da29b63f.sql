SELECT count(*)
      FROM t1, kv
     WHERE key NOT LIKE '%]'
       AND json_insert(json_remove(j5,key),key,val)->>key IS NOT val
