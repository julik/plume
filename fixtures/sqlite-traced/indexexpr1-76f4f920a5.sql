SELECT json_array(+json_extract(j,'$.x')) FROM t1 WHERE a=1;
