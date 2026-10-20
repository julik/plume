VALUES (1, 2), (3, 4), (
    ( SELECT column1 FROM ( VALUES (5, 6), (7, 8) ) ),
    ( SELECT max(column2) FROM ( VALUES (5, 1), (7, 6) ) )
  )
