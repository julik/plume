WITH c(y) AS (VALUES(0),(1),(2),(3),(4),(5),(6))
  SELECT
    y,
    x->y AS '->',
    CASE WHEN subtype(x->y) THEN 'json' ELSE typeof(x->y) END AS 'type',
    x->>y AS '->>',
    CASE WHEN subtype(x->>y) THEN 'json' ELSE typeof(x->>y) END AS 'type',
    json_extract(x,format('$[%d]',y)) AS 'json_extract',
    CASE WHEN subtype(json_extract(x,format('$[%d]',y)))
      THEN 'json' ELSE typeof(json_extract(x,format('$[%d]',y))) END AS 'type'
  FROM c, t1 ORDER BY y;
