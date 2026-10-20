SELECT *
        FROM t1 JOIN (t2 JOIN (main.t4 JOIN aux.t4 ON aux.t4.a=main.t4.a+111)
                              ON main.t4.a=t2.a+222)
                     ON t2.a=t1.a+111;
