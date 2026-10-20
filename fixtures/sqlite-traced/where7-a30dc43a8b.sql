SELECT a FROM t2
      WHERE (g='srqponm' AND f GLOB 'cdefg*')
         OR (g='ihgfedc' AND f GLOB 'defgh*')
         OR a=80
         OR a=53
         OR a=62
         OR a=49
         OR a=53
         OR a=56
         OR (d>=83.0 AND d<84.0 AND d NOT NULL)
