CREATE TABLE t1a(
    gcx AS (x+0) REFERENCES t1(a) ON DELETE CASCADE,
    id,
    x,
    gcid AS (1*id)
  );
