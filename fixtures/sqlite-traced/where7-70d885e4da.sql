SELECT a FROM t2
      WHERE ((a BETWEEN 80 AND 82) AND a!=81)
         OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
         OR (d>=42.0 AND d<43.0 AND d NOT NULL)
         OR ((a BETWEEN 49 AND 51) AND a!=50)
         OR (g='ihgfedc' AND f GLOB 'bcdef*')
