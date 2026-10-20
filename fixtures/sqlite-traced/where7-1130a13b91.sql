SELECT a FROM t2
      WHERE f='tuvwxyzab'
         OR (g='nmlkjih' AND f GLOB 'efghi*')
