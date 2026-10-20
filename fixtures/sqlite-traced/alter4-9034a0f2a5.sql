SELECT sql GLOB '*SET qty=qty+excluded.qty WHERE*'
    FROM sqlite_schema WHERE name = 'add_stock';
