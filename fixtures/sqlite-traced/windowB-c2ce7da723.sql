SELECT json_group_array(json(j)) OVER (ORDER BY id) FROM testjson;
