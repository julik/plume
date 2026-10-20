CREATE INDEX i1 ON t1( if( json_valid(j, 6), j->'a' )  );
