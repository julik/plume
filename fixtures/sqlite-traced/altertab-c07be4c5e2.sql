CREATE VIEW v0 AS
    WITH p AS ( SELECT 1 FROM t1 ),
         g AS ( SELECT 1 FROM p, t1 )
    SELECT 1 FROM g;
