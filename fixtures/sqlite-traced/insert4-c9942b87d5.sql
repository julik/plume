CREATE TEMP TABLE x(
    rid INTEGER,
    pid INTEGER,
    mid INTEGER,
    px INTEGER DEFAULT(0) CHECK(px IN(0, 1))
  );
