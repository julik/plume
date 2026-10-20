SELECT a FROM t2
      WHERE (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
         OR b=814
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
