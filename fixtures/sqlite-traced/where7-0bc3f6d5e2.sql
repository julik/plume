SELECT a FROM t2
      WHERE b=740
         OR b=564
         OR (g='onmlkji' AND f GLOB 'zabcd*')
         OR a=11
         OR ((a BETWEEN 44 AND 46) AND a!=45)
         OR b=322
         OR (d>=6.0 AND d<7.0 AND d NOT NULL)
         OR (g='utsrqpo' AND f GLOB 'wxyza*')
         OR b=902
         OR c>=34035
