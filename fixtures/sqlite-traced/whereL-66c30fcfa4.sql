SELECT *
    FROM (SELECT 0.0 AS col_0) as subQuery
    LEFT JOIN t0 ON ((CASE ''
          WHEN t0.c0 THEN subQuery.col_0
          ELSE (t0.c0) END) LIKE (((((subQuery.col_0))))))
    LEFT JOIN t1 ON ((subQuery.col_0) == (false)) WHERE t1.c0;
