SELECT a FROM t2
      WHERE b=443
         OR (d>=10.0 AND d<11.0 AND d NOT NULL)
         OR b=839
         OR (d>=51.0 AND d<52.0 AND d NOT NULL)
         OR (g='onmlkji' AND f GLOB 'xyzab*')
         OR (g='vutsrqp' AND f GLOB 'nopqr*')
         OR c=7007
