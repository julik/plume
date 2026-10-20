DELETE FROM t0 WHERE NOT (
    (t0.vkey <= t0.c1) AND
    (t0.vkey <> (SELECT vkey FROM t0 ORDER BY vkey LIMIT 1 OFFSET 2))
  );
