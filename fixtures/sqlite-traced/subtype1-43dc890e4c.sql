SELECT id, subtype( if( json_valid(j, 6), j->'a' )  ) FROM t1;
