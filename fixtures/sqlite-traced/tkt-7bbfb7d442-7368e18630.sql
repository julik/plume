CREATE TABLE InventoryItem (
    SKU INTEGER NOT NULL,
    Variant INTEGER NOT NULL DEFAULT 0,
    DeptCode INTEGER NOT NULL,
    GroupCode INTEGER NOT NULL,
    ItemDescription VARCHAR(120) NOT NULL,
    PRIMARY KEY(SKU, Variant)
  );
