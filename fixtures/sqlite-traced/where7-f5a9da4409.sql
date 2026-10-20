SELECT a FROM t2
      WHERE ((a BETWEEN 67 AND 69) AND a!=68)
         OR ((a BETWEEN 79 AND 81) AND a!=80)
         OR c=18018
         OR b=792
         OR (g='mlkjihg' AND f GLOB 'jklmn*')
         OR (d>=77.0 AND d<78.0 AND d NOT NULL)
         OR (d>=8.0 AND d<9.0 AND d NOT NULL)
         OR (d>=91.0 AND d<92.0 AND d NOT NULL)
         OR f='uvwxyzabc'
         OR (d>=74.0 AND d<75.0 AND d NOT NULL)
