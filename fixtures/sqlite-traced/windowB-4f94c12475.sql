SELECT json_group_array(json(j)) OVER (
      ORDER BY id ROWS BETWEEN 1 FOLLOWING AND 2 FOLLOWING
    ) FROM testjson;
