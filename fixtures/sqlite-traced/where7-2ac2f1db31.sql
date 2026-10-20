SELECT a FROM t2
      WHERE b=209
         OR b=198
         OR a=52
         OR (d>=64.0 AND d<65.0 AND d NOT NULL)
         OR d<0.0
         OR (g='rqponml' AND f GLOB 'jklmn*')
         OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
         OR b=168
         OR (d>=24.0 AND d<25.0 AND d NOT NULL)
         OR f='uvwxyzabc'
         OR (d>=42.0 AND d<43.0 AND d NOT NULL)
