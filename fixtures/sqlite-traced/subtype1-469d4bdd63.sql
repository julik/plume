SELECT * FROM t0 NOT INDEXED 
  WHERE (c0=json_quote(1) AND json_array(c0)='[1]');
