SELECT json_insert('{}', '$.a', iif(1,json(y),123))->>'$.a.b' FROM t1;
