INSERT INTO t1 SELECT value, randomblob(value) FROM nums
                    WHERE value BETWEEN 1 and 1000;
