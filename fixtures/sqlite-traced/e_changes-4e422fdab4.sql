CREATE TRIGGER q2_insert BEFORE INSERT ON q2 BEGIN

    /* changes() returns value from previous I/U/D in callers context */
    INSERT INTO q1 VALUES('1:' || changes());

    /* changes() returns value of previous I/U/D in this context */
    INSERT INTO q3 VALUES(changes()), (2), (3);
    INSERT INTO q1 VALUES('2:' || changes());
    INSERT INTO q3 VALUES(changes() + 3), (changes()+4);
    SELECT 'this does not affect things!';
    INSERT INTO q1 VALUES('3:' || changes());
    UPDATE q3 SET w = w+10 WHERE w%2;
    INSERT INTO q1 VALUES('4:' || changes());
    DELETE FROM q3;
    INSERT INTO q1 VALUES('5:' || changes());
  END;
