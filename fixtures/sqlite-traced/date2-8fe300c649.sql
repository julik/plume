EXPLAIN QUERY PLAN
  SELECT a FROM t3
   WHERE typeof(b)='real'
     AND datetime(b) BETWEEN '2017-07-04' AND '2017-07-08';
