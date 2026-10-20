SELECT a FROM t2
      WHERE a=41
         OR a=43
         OR a=92
         OR (g='fedcbaz' AND f GLOB 'rstuv*')
         OR (g='mlkjihg' AND f GLOB 'klmno*')
