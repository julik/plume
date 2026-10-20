SELECT id, count(*) FROM t9 GROUP BY id HAVING count(*)!=1;
