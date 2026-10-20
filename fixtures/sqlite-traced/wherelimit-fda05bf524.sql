CREATE VIEW tv(r,a) AS
       SELECT rowid, a FROM t2 UNION ALL SELECT rowid, a FROM t1;
