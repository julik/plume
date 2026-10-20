CREATE TABLE mlink(
    mid INTEGER,
    fid INTEGER,
    pmid INTEGER,
    pid INTEGER,
    fnid INTEGER REFERENCES filename,
    pfnid INTEGER,
    mperm INTEGER,
    isaux BOOLEAN DEFAULT 0
  );
