SELECT subtype( (SELECT json_group_object('k', a) FROM t1) );
