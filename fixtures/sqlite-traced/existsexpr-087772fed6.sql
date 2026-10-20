SELECT count(*), parent.id FROM parent
   WHERE EXISTS (
      SELECT 1 FROM child_a WHERE child_a.id = parent.id
      UNION
      SELECT 1 FROM child_b WHERE child_b.id = parent.id
   )
   GROUP BY id;
