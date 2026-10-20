SELECT a FROM t2
      WHERE (d>=28.0 AND d<29.0 AND d NOT NULL)
         OR b=421
         OR (g='qponmlk' AND f GLOB 'qrstu*')
         OR b=704
         OR a=90
         OR a=78
         OR 1000000<b
         OR (d>=80.0 AND d<81.0 AND d NOT NULL)
         OR (g='ihgfedc' AND f GLOB 'defgh*')
         OR ((a BETWEEN 53 AND 55) AND a!=54)
