SELECT a FROM t2
      WHERE (g='ihgfedc' AND f GLOB 'bcdef*')
         OR b=168
         OR b=25
         OR (d>=89.0 AND d<90.0 AND d NOT NULL)
         OR (g='lkjihgf' AND f GLOB 'opqrs*')
