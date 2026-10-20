CREATE TABLE IF NOT EXISTS c30 (
      line INTEGER, 
      master REFERENCES p30(id), 
      PRIMARY KEY(master)
  ) WITHOUT ROWID;
