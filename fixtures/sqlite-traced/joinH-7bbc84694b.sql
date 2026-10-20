SELECT lower(x), quote(y) FROM x1 LEFT JOIN x2 USING (x) JOIN x3 USING (x) FULL JOIN t4;
