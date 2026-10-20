SELECT a FROM t2
      WHERE b=905
         OR f='hijklmnop'
         OR (d>=45.0 AND d<46.0 AND d NOT NULL)
         OR (d>=26.0 AND d<27.0 AND d NOT NULL)
         OR (g='ihgfedc' AND f GLOB 'cdefg*')
         OR (g='utsrqpo' AND f GLOB 'wxyza*')
         OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
         OR b=817
         OR (d>=20.0 AND d<21.0 AND d NOT NULL)
