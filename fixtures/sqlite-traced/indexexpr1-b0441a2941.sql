SELECT json_insert('{}', '$.a', coalesce(null,json(y)))->>'$.a.b' FROM t1;
