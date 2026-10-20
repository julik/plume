SELECT a FROM t2
      WHERE f='cdefghijk'
         OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
         OR (g='ihgfedc' AND f GLOB 'defgh*')
         OR (d>=59.0 AND d<60.0 AND d NOT NULL)
