-- Do an UPSERT on the b column
  INSERT INTO tab (prim, b)
  VALUES ('2001-01-01',5)
      ON CONFLICT(prim) DO UPDATE SET  b=excluded.b;
