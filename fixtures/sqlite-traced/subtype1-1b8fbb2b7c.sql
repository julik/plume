CREATE INDEX i1 ON t1( (CASE WHEN json_valid(j, 6) THEN j->'a' ELSE j END) );
