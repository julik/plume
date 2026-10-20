SELECT a FROM t2
      WHERE f='fghijklmn'
         OR (g='qponmlk' AND f GLOB 'nopqr*')
         OR (g='edcbazy' AND f GLOB 'vwxyz*')
         OR b=671
         OR (g='xwvutsr' AND f GLOB 'hijkl*')
