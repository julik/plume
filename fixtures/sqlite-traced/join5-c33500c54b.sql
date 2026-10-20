SELECT *
  FROM (
      SELECT 'apple' fruit
      UNION ALL SELECT 'banana'
  ) a
  JOIN (
      SELECT 'apple' fruit
      UNION ALL SELECT 'banana'
  ) b ON a.fruit=b.fruit
  LEFT JOIN (
      SELECT 1 isyellow
  ) c ON b.fruit='banana';
