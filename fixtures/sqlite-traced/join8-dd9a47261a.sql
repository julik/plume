INSERT INTO t1 SELECT value, 1 FROM generate_series(1,256) WHERE value & 1;
