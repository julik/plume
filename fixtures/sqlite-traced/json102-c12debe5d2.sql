SELECT
    id,
    x->'a' AS '->',
    CASE WHEN subtype(x->'a') THEN 'json' ELSE typeof(x->'a') END AS 'type',
    x->>'a' AS '->>',
    CASE WHEN subtype(x->>'a') THEN 'json' ELSE typeof(x->>'a') END AS 'type',
    json_extract(x,'$.a') AS 'json_extract',
    CASE WHEN subtype(json_extract(x,'$.a'))
         THEN 'json' ELSE typeof(json_extract(x,'$.a')) END AS 'type'
    FROM t1 ORDER BY id;
