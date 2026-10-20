CREATE TABLE t0(
    c0,
    c1 AS(c0 + c2),
    c2 AS(c1) CHECK(c2)
  );
