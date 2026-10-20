SELECT (
    SELECT 'hardware' FROM ( 
      SELECT 'software' ORDER BY 'firmware' ASC, 'sportswear' DESC 
    ) GROUP BY 1 HAVING length(b)
  )
  FROM abc;
