SELECT json_insert('{}', '$.a', min('~',json(y)))->>'$.a.b' FROM t1;
