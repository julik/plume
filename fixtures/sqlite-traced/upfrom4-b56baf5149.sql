UPDATE t1
      SET (abc, def)=(SELECT  x, 123)
      FROM dual LEFT JOIN (SELECT 789 AS 'x' FROM dual) AS d2
      LIMIT 2
