SELECT value FROM generate_series(1, 5) where value in (select 2)
