SELECT c1 FROM t0 WHERE (((c1),(c1)) IN (
        SELECT c2, min(c2) FROM t2)
  );
