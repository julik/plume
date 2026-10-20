SELECT id, subtype( CAST( if( json_valid(j, 6), j->'a' ) AS TEXT ) ) FROM t1;
