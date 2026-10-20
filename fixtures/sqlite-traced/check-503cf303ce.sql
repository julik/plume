CREATE TABLE t3(
        x, y, z,
        CHECK( x<(SELECT min(x) FROM t1) )
      );
