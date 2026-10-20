SELECT t0.c0, v0.c0, vt0.name
     FROM v0, t0 LEFT JOIN pragma_table_info('t0') AS vt0
       ON vt0.name LIKE 'c0'
     WHERE v0.c0 == 0;
