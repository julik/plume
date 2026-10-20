SELECT * FROM vt1 
     WHERE b IN ('abc', 'def') AND a IN (SELECT 1 UNION SELECT 2)
