WITH out(i, j, k) AS ( 
      VALUES(1234, 5678, 9012) 
  )
  SELECT (
    SELECT (
      SELECT min(abc) = ( SELECT ( SELECT 1234 fROM (SELECT abc) ) ) 
      FROM (
        SELECT sum( out.i ) + ( SELECT sum( out.i ) ) AS abc FROM (SELECT out.j)
      )
    ) 
  ) FROM out;
