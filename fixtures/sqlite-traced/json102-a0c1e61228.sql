SELECT json_valid(jsonb_set('{k:1}','$.v', printf('%.*c',120,'x')),6);
