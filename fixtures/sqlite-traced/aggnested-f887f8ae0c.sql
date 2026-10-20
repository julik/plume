SELECT ( 
    SELECT c FROM (SELECT t2.b AS c FROM t1) GROUP BY c HAVING t2.b
  )
  FROM t2 GROUP BY 'constant_string';
