ALTER TABLE t1 ADD COLUMN c CHECK( if(c<10,1,sqlite_fail('bummer',1)));
