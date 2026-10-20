SELECT a FROM t2
      WHERE c=29029
         OR f='efghijklm'
         OR (d>=48.0 AND d<49.0 AND d NOT NULL)
         OR a=26
         OR (f GLOB '?efgh*' AND f GLOB 'defg*')
