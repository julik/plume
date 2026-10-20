SELECT * FROM y1 WHERE EXISTS ( 
      SELECT 1 FROM y2 one, y2 two WHERE one.z=a-1 AND one.y=a-1
  )
