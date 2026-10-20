CREATE TABLE t1(a COLLATE mycollate, CHECK (a IN ('one', 'two', 'three')));
