SELECT * FROM (t1) 
   WHERE ((abs(aa)=1 AND 1=2) OR abs(aa)=2)
     AND abs(bb)=3
  ORDER BY +1, +2;
