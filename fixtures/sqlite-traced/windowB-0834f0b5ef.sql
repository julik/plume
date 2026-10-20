WITH y AS (
      SELECT Row_Number() OVER (win) FROM x WINDOW win AS (PARTITION BY a)
  )
  SELECT * FROM y;
