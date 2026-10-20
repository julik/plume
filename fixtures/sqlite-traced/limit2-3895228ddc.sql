SELECT t2.cc, t2.dd, t2.ee FROM t1 CROSS JOIN t2 ON t1.aa=t2.cc
  WHERE t1.bb='meal'
  ORDER BY t2.dd LIMIT 1;
