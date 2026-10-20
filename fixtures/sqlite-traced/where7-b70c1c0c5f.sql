SELECT a FROM t2
      WHERE (g='ihgfedc' AND f GLOB 'efghi*')
         OR a=34
         OR f='rstuvwxyz'
         OR (d>=10.0 AND d<11.0 AND d NOT NULL)
         OR b=729
