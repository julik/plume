SELECT * FROM vt1 
     WHERE a IN (SELECT 1 UNION SELECT 2) AND b IN ('abc', 'def')
