SELECT json_group_array(json(j)) OVER (
      ORDER BY id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) FROM testjson;
