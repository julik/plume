SELECT a FROM t2
      WHERE ((a BETWEEN 66 AND 68) AND a!=67)
         OR b=564
         OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
         OR b=234
         OR b=641
         OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR (d>=5.0 AND d<6.0 AND d NOT NULL)
         OR a=98
