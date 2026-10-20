SELECT a FROM t2
      WHERE c=8008
         OR (d>=39.0 AND d<40.0 AND d NOT NULL)
         OR (d>=100.0 AND d<101.0 AND d NOT NULL)
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR b=300
         OR (g='yxwvuts' AND f GLOB 'cdefg*')
         OR a=41
         OR (g='onmlkji' AND f GLOB 'xyzab*')
         OR b=135
         OR b=605
