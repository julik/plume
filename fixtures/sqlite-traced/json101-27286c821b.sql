SELECT *, 'NL' FROM t1 CROSS JOIN t2
   WHERE EXISTS(SELECT 1 FROM json_each(t1.json,'$.items') AS Z
                 WHERE Z.value==t2.id);
