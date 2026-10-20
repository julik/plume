CREATE INDEX i1 ON t1( CAST( if( json_valid(j, 6), j->'a' ) AS TEXT ) );
