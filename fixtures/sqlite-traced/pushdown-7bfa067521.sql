CREATE VIEW t0(w,x,y,z) AS
    SELECT w,x,y,z FROM t01 UNION ALL SELECT w,x,y,z FROM t02;
