SELECT 'match' WHERE EXISTS (
      SELECT 1 FROM t b
      WHERE (b.parent IS NULL OR b.parent = 99)
      AND 5 <= +b.n
  )
