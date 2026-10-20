SELECT json_group_array(json(j)) FILTER (WHERE id!=2) OVER (
      ORDER BY id ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING
    ) FROM testjson
