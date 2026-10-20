CREATE TABLE t1(a, CHECK (a COLLATE mycollate IN ('one', 'two', 'three')));
