SELECT a, b, quote(c) FROM t WHERE b IN (0,1) AND c GLOB 'A'
  ORDER BY a DESC, b DESC;
