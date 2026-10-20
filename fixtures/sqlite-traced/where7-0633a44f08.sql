SELECT a FROM t2
      WHERE f='tuvwxyzab'
         OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
