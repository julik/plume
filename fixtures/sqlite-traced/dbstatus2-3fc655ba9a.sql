-- Insert 5-6 MB of data.
    WITH s(i) AS ( SELECT 1 UNION ALL SELECT i+1 FROM s WHERE i<75000 )
    INSERT INTO data SELECT i, hex(randomblob(50)) FROM s;
