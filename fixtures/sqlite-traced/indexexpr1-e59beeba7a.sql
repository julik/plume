CREATE UNIQUE INDEX t3abc ON t3(CAST(a AS text), b, substr(c,1,3));
