SELECT count(*)
      FROM t1, kv
     WHERE p->>key IS NOT val
