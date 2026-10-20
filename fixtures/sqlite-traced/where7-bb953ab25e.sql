SELECT a FROM t2
      WHERE (f GLOB '?ijkl*' AND f GLOB 'hijk*')
         OR (d>=58.0 AND d<59.0 AND d NOT NULL)
         OR (d>=13.0 AND d<14.0 AND d NOT NULL)
