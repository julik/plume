INSERT INTO x1 VALUES
        (1, 1),
        (2, (SELECT * FROM  (VALUES('a'), ('b'), ('c'), ('d')) ))
