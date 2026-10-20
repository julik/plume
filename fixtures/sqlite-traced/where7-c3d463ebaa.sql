SELECT a FROM t2
      WHERE a=41
         OR b=990
         OR (d>=36.0 AND d<37.0 AND d NOT NULL)
         OR b=605
         OR (g='srqponm' AND f GLOB 'cdefg*')
         OR (d>=36.0 AND d<37.0 AND d NOT NULL)
         OR (g='vutsrqp' AND f GLOB 'qrstu*')
         OR b=968
         OR a=66
