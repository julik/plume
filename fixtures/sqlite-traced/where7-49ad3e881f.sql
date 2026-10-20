SELECT a FROM t2
      WHERE b=399
         OR c=28028
         OR (d>=82.0 AND d<83.0 AND d NOT NULL)
         OR (g='qponmlk' AND f GLOB 'qrstu*')
         OR (d>=98.0 AND d<99.0 AND d NOT NULL)
