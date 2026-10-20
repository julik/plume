CREATE VIEW v3 AS
    WITH t4(Att, Val, Act) AS (VALUES
      ('C', 'D', 'E'),
      ('F', 'G', 'H')
    )
    SELECT D.Id Id, P.Name Protocol, T.Att Att, T.Val Val, T.Act Act
    FROM t1 D
    CROSS JOIN v2 P
    CROSS JOIN t4 T;
