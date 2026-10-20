UPDATE t1 SET b = json_set(b, '$.a', b->>'a' + 1)
