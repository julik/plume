SELECT a FROM t2
      WHERE b=1089
         OR b=495
         OR b=157
         OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
         OR (d>=59.0 AND d<60.0 AND d NOT NULL)
         OR (g='yxwvuts' AND f GLOB 'bcdef*')
         OR (g='xwvutsr' AND f GLOB 'hijkl*')
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR f='wxyzabcde'
