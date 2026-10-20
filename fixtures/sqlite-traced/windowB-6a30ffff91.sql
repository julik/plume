SELECT id, json_group_object(k,v) OVER 
                 (ORDER BY id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS jx
       FROM t1;
