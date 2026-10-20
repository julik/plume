SELECT a FROM t2
      WHERE c=13013
         OR (g='fedcbaz' AND f GLOB 'qrstu*')
         OR (d>=42.0 AND d<43.0 AND d NOT NULL)
         OR (g='mlkjihg' AND f GLOB 'jklmn*')
         OR b=47
         OR (d>=79.0 AND d<80.0 AND d NOT NULL)
         OR (g='kjihgfe' AND f GLOB 'rstuv*')
         OR b=828
