SELECT *
    FROM (SELECT 'apple' fruit UNION ALL SELECT 'banana')
         LEFT JOIN (SELECT 1) ON fruit='banana';
