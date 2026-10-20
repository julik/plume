SELECT a FROM t2
      WHERE b=1059
         OR (g='srqponm' AND f GLOB 'ghijk*')
         OR (g='utsrqpo' AND f GLOB 'tuvwx*')
         OR (g='nmlkjih' AND f GLOB 'fghij*')
         OR (d>=17.0 AND d<18.0 AND d NOT NULL)
         OR (d>=37.0 AND d<38.0 AND d NOT NULL)
         OR (g='onmlkji' AND f GLOB 'abcde*')
         OR ((a BETWEEN 39 AND 41) AND a!=40)
