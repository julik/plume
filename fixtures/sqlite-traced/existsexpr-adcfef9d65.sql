SELECT * FROM y1 WHERE EXISTS ( 
      SELECT 1 FROM y2 WHERE z=max(a,b) AND y=min(b,a) AND x=z
  )
