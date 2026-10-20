SELECT id, json_group_object(if(id<2 OR id>6,k),v) OVER 
                 (ORDER BY id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS jx
       FROM t1;
