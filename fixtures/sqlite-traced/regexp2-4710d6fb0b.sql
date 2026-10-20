CREATE TRIGGER tr1 AFTER INSERT ON t1 BEGIN
    INSERT INTO x1 VALUES(
        new.a REGEXP 'abc',
        new.b REGEXP 'abc',
        new.c REGEXP 'abc'
    );
  END;
