WITH c(x) AS (VALUES('{a:5,b:6}'))
  SELECT x->>'a', json(x), json_valid(x), NOT json_error_position(x) FROM c;
