SELECT a FROM t2
      WHERE (f GLOB '?jklm*' AND f GLOB 'ijkl*')
         OR (d>=77.0 AND d<78.0 AND d NOT NULL)
         OR b=157
         OR b=1026
