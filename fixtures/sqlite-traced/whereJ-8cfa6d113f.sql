EXPLAIN QUERY PLAN
  SELECT aid, sid, MAX(edate) edate
    FROM tx1
   WHERE cid = 115790
     AND sid = 9100
     AND edate <= 20140430 AND edate >= 20120429
   GROUP BY aid;
