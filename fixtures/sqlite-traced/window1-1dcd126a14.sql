SELECT sum(345+b)      OVER (ORDER BY b),
         sum(avg(678)) OVER (ORDER BY c) FROM a;
