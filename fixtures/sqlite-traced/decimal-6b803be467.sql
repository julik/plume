SELECT decimal_sum(decimal_add(val||'e+20',decimal_add(val,val||'e-20')))
    FROM t3;
