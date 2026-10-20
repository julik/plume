INSERT INTO InventoryControl(SKU, Variant, ControlDate) SELECT 
      II.SKU AS SKU, II.Variant AS Variant, '2011-08-30' AS ControlDate 
      FROM InventoryItem II;
