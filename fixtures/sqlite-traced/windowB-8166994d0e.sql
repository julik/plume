SELECT json_group_object(x,json(j)) FILTER (WHERE id!=2) OVER (
      ORDER BY id ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING
    ) FROM testjson
