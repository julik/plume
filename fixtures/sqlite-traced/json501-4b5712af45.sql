WITH c(x) AS (VALUES('{a: "abc'||char(0x5c,0x0a)||'xyz"}'))
  SELECT x->>'a', json(x), json_valid(x), NOT json_error_position(x) FROM c;
