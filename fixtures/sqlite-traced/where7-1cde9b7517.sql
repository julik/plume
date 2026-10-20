SELECT a FROM t2
      WHERE b=99
         OR (g='nmlkjih' AND f GLOB 'fghij*')
         OR (d>=98.0 AND d<99.0 AND d NOT NULL)
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR (d>=46.0 AND d<47.0 AND d NOT NULL)
