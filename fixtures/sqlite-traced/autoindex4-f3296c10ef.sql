SELECT Items.ItemName
    FROM Items
      LEFT JOIN A ON (A.Name = Items.ItemName and Items.ItemName = 'dummy')
      LEFT JOIN B ON (B.Name = Items.ItemName)
    WHERE Items.Name = 'Parent'
    ORDER BY Items.ItemName;
