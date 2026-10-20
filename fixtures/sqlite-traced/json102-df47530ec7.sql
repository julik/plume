SELECT json_valid(json_set('{k:1}','$.v', printf('%.*c',120,'x'))||' ');
