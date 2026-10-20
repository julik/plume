SELECT a FROM t2
      WHERE ((a BETWEEN 14 AND 16) AND a!=15)
         OR (g='wvutsrq' AND f GLOB 'jklmn*')
         OR (g='wvutsrq' AND f GLOB 'ijklm*')
         OR (g='hgfedcb' AND f GLOB 'ijklm*')
         OR c=1001
         OR (g='hgfedcb' AND f GLOB 'hijkl*')
         OR (d>=16.0 AND d<17.0 AND d NOT NULL)
         OR (g='ihgfedc' AND f GLOB 'abcde*')
         OR c=33033
