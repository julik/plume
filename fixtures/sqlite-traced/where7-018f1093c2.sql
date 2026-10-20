SELECT a FROM t2
      WHERE a=51
         OR (g='fedcbaz' AND f GLOB 'stuvw*')
         OR (g='edcbazy' AND f GLOB 'uvwxy*')
         OR b=330
