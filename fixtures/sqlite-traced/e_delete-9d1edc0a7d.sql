SELECT count(*) FROM temp.t7 UNION ALL SELECT count(*) FROM main.t7 UNION ALL
  SELECT count(*) FROM aux.t7  UNION ALL SELECT count(*) FROM aux2.t7;
