CREATE TABLE items (
    Id INTEGER  /* rowid alias */,
    Item INTEGER  /* any type */,
    Test TEXT  /* TEXT or BLOB */,
    Filler,  /* any type */
    PRIMARY KEY(Id),
    UNIQUE(Item, Id)
  );
