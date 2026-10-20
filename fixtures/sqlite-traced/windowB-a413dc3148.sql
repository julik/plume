SELECT json_group_array(json(j)) OVER (
      ORDER BY id ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING
    ) FROM testjson;
