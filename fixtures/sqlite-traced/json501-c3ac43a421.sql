WITH c(x) AS (VALUES('[5, 6,]'))
  SELECT x->>1, json(x), json_valid(x), NOT json_error_position(x) FROM c;
