SELECT A.w, B.p, C.w FROM t1 as A, t2 as B, t1 as C
    WHERE A.w=15 AND B.p=C.w AND B.r=10202-A.y
