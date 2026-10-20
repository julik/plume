SELECT a FROM t2
      WHERE (g='onmlkji' AND f GLOB 'zabcd*')
         OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
         OR a=13
