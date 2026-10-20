SELECT test_frombind(x.a,y.b,x.c,:123,y.e,x.f,$xyz+y.f) FROM t1 x, t1 y;
