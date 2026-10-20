SELECT subtype( (SELECT json_group_array(a) FROM t1) );
