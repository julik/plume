WITH x1(a, b) AS (
    VALUES(1, 2), ('a', 'b')
  )
  SELECT * FROM x1 one, x1 two
