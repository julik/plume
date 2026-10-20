SELECT id, subtype( CAST( if( json_valid(j, 6), j->'a' ) AS TEXT ) ) FROM t1 INDEXED BY i1 ORDER BY id;
