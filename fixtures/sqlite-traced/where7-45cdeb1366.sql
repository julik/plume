SELECT a FROM t2
      WHERE g IS NULL
         OR (g='onmlkji' AND f GLOB 'wxyza*')
