SELECT subtype( (SELECT max(json(b)) FROM t1) );
