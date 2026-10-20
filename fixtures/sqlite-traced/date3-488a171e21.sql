WITH inc(x) AS (VALUES(-10) UNION ALL SELECT x+1 FROM inc WHERE x<100)
  SELECT count(*) FROM inc
  WHERE datetime('1970-01-01',format('%+d days',x))
     <> datetime(unixepoch('1970-01-01',format('%+d days',x)),'auto');
