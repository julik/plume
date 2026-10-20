CREATE TRIGGER AFTER INSERT ON t2 BEGIN

    SELECT group_conct(
        123 ORDER BY (
          SELECT 1 FROM ( VALUES(a, 'b'), ('c') )
          )) 
    FROM t1;

  END;
