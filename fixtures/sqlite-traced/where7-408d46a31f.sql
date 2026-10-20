SELECT a FROM t2
      WHERE c=23023
         OR f='efghijklm'
         OR ((a BETWEEN 39 AND 41) AND a!=40)
         OR b=1045
         OR (d>=24.0 AND d<25.0 AND d NOT NULL)
         OR f='uvwxyzabc'
         OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
