SELECT a FROM t2
      WHERE c=6006
         OR b=938
         OR b=484
         OR b=652
         OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
         OR (g='mlkjihg' AND f GLOB 'ghijk*')
         OR f='opqrstuvw'
