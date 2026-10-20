SELECT a FROM t2
      WHERE ((a BETWEEN 77 AND 79) AND a!=78)
         OR b=894
         OR c=28028
         OR b=905
         OR (g='ponmlkj' AND f GLOB 'tuvwx*')
         OR (g='kjihgfe' AND f GLOB 'stuvw*')
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
         OR b=1037
