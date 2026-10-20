SELECT a FROM t2
      WHERE b=847
         OR b=190
         OR ((a BETWEEN 38 AND 40) AND a!=39)
         OR ((a BETWEEN 70 AND 72) AND a!=71)
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR (g='tsrqpon' AND f GLOB 'xyzab*')
         OR b=704
