SELECT a FROM t2
      WHERE (f GLOB '?stuv*' AND f GLOB 'rstu*')
         OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
         OR (g='srqponm' AND f GLOB 'efghi*')
         OR (g='qponmlk' AND f GLOB 'pqrst*')
         OR b=762
         OR b=484
         OR b=190
         OR ((a BETWEEN 95 AND 97) AND a!=96)
         OR (d>=74.0 AND d<75.0 AND d NOT NULL)
         OR (g='mlkjihg' AND f GLOB 'jklmn*')
         OR b=1023
