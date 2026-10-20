UPDATE t1 SET b = json_set( 
        json_set(b, '$.a', b->>'a' + 1),
        '$.b', b->>'b' + 1
    );
