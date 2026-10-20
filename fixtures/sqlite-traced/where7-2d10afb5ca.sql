SELECT a FROM t2
      WHERE f='uvwxyzabc'
         OR f='xyzabcdef'
         OR (g='ihgfedc' AND f GLOB 'bcdef*')
         OR (d>=70.0 AND d<71.0 AND d NOT NULL)
         OR ((a BETWEEN 51 AND 53) AND a!=52)
         OR (d>=31.0 AND d<32.0 AND d NOT NULL)
         OR b=69
         OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
