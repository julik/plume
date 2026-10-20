INSERT INTO x1 VALUES
        (1, (SELECT * FROM  (VALUES('a'), ('b'), ('c'), ('d'), ('e')) ))
