CREATE VIEW t2 AS
     WITH t3 AS (SELECT 1 FROM t1 AS bb, t1 AS cc WHERE cc.aa <= sts.aa)
     SELECT 1 FROM t3 AS dd;
