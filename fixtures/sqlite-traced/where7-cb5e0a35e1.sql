SELECT a FROM t2
      WHERE (d>=55.0 AND d<56.0 AND d NOT NULL)
         OR f='abcdefghi'
         OR b=267
         OR (g='ihgfedc' AND f GLOB 'abcde*')
         OR (g='utsrqpo' AND f GLOB 'uvwxy*')
         OR a=82
         OR a=54
         OR (d>=16.0 AND d<17.0 AND d NOT NULL)
         OR b=1078
