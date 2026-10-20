INSERT INTO t1 VALUES(2, NULL, 'zero') ON CONFLICT (a) 
      DO UPDATE SET c = 'one';
