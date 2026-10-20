SELECT json_insert( '{}', '$.y', coalesce( json_extract(j, '$.x'), 'five' ) )
  FROM t1 WHERE a=2
