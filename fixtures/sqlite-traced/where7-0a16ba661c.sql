SELECT a FROM t2
      WHERE b=561
         OR ((a BETWEEN 28 AND 30) AND a!=29)
         OR b=594
         OR ((a BETWEEN 39 AND 41) AND a!=40)
         OR b=861
         OR (d>=90.0 AND d<91.0 AND d NOT NULL)
         OR b=949
         OR (g='utsrqpo' AND f GLOB 'stuvw*')
         OR (g='nmlkjih' AND f GLOB 'cdefg*')
