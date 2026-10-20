INSERT INTO excluded AS x1 VALUES('hello', 1, 1, NULL) 
      ON CONFLICT(x, [a b]) WHERE y=1
      DO UPDATE SET w=w||w WHERE excluded.x=1;
