ALTER TABLE t1 ADD CONSTRAINT c1 CHECK( sqlite_drop_column(22,'CREATE TABLE a(b,c)', 0));
