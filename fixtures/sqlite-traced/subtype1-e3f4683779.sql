SELECT count(*) FROM t2
   WHERE (c2=json_quote(0)) AND (json_array(c2)<'[0]');
