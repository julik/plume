SELECT id, subtype( if( json_valid(j, 6), j->'a' ) COLLATE nocase ) FROM t1 INDEXED BY i1 ORDER BY id;
