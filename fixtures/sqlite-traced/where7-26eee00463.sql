SELECT a FROM t2
      WHERE (d>=56.0 AND d<57.0 AND d NOT NULL)
         OR a=32
         OR (g='qponmlk' AND f GLOB 'mnopq*')
         OR (g='xwvutsr' AND f GLOB 'efghi*')
         OR c=32032
