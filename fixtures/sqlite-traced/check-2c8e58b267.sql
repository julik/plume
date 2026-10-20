CREATE TABLE t3(
      x, y, z,
      CHECK( t2.x<x )
    );
