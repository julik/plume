SELECT a FROM t2
      WHERE b=124
         OR (d>=92.0 AND d<93.0 AND d NOT NULL)
         OR ((a BETWEEN 41 AND 43) AND a!=42)
         OR (d>=96.0 AND d<97.0 AND d NOT NULL)
         OR b=759
         OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
         OR ((a BETWEEN 45 AND 47) AND a!=46)
         OR (g='kjihgfe' AND f GLOB 'uvwxy*')
