CREATE TABLE t0 (
    c0,
    c1 a UNIQUE AS (1),
    c2,
    c3 REFERENCES t0(c1)
  );
