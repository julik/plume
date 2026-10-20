UPDATE items SET test='ok'
    WHERE (Id, Item) IN (SELECT Id, Item FROM items);
