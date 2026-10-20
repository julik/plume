SELECT a FROM t2
      WHERE b=685
         OR a=14
         OR b=990
         OR (g='tsrqpon' AND f GLOB 'abcde*')
         OR f='efghijklm'
         OR c=1001
         OR b=784
         OR (g='srqponm' AND f GLOB 'ghijk*')
         OR (d>=69.0 AND d<70.0 AND d NOT NULL)
