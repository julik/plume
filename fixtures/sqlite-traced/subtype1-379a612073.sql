SELECT id, subtype( (CASE WHEN json_valid(j, 6) THEN j->'a' ELSE j END) ) FROM t1 INDEXED BY i1 ORDER BY id;
