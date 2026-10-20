SELECT * FROM y1 WHERE EXISTS ( 
      SELECT count(*) FROM y2 WHERE z=a-1 AND y=a-1
  )
