SELECT 11 = (
                SELECT b
                  FROM (
                         SELECT a AS b
                           FROM dual
                           LEFT JOIN (SELECT 22 AS a FROM dual)
                       )
                 GROUP BY b, b
              );
