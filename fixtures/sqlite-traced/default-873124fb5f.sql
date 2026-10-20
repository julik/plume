CREATE TABLE t3(
      x INTEGER,
      y INTEGER DEFAULT (max(x,5))
    )
