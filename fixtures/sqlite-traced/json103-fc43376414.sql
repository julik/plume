SELECT quote(jsonb_group_array(a)) FROM t1 WHERE a<0 AND typeof(a)!='blob';
