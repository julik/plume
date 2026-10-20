WITH data(a,b) AS (
      SELECT 0, 0 UNION ALL SELECT a+1, b+1 FROM data WHERE a<99
  )
  INSERT INTO t1 SELECT * FROM data;
