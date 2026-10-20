SELECT a FROM t2
      WHERE a=48
         OR c=15015
         OR ((a BETWEEN 65 AND 67) AND a!=66)
         OR ((a BETWEEN 97 AND 99) AND a!=98)
         OR (d>=44.0 AND d<45.0 AND d NOT NULL)
         OR b=110
         OR f='klmnopqrs'
         OR (g='fedcbaz' AND f GLOB 'qrstu*')
         OR (g='onmlkji' AND f GLOB 'abcde*')
         OR b=674
         OR (g='fedcbaz' AND f GLOB 'stuvw*')
