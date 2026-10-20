with
    cte1(x, y) AS ( select 1, 2, 3 ),
    cte2(z) as ( select 1 from cte1 UNION ALL SELECT z+1 FROM cte2 WHERE z<5)
  select * from cte2, cte1;
