SELECT 'result' FROM t1, t2, t3 
  WHERE t2.c=t1.b AND t2.d!='silly'
    AND t3.e=t1.b AND t3.f!='silly'
