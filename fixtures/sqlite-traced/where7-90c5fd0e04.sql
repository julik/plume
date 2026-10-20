SELECT a FROM t2
      WHERE (d>=10.0 AND d<11.0 AND d NOT NULL)
         OR b=630
         OR a=55
         OR c=26026
         OR (g='kjihgfe' AND f GLOB 'qrstu*')
         OR (d>=23.0 AND d<24.0 AND d NOT NULL)
