SELECT a FROM t2
      WHERE a=3
         OR (d>=62.0 AND d<63.0 AND d NOT NULL)
         OR b=355
         OR b=814
         OR (g='ihgfedc' AND f GLOB 'bcdef*')
         OR a=81
         OR (g='qponmlk' AND f GLOB 'qrstu*')
         OR b=542
         OR b=795
