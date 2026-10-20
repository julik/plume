SELECT group_concat(x,'') OVER (
      ORDER BY id ROWS BETWEEN 1 FOLLOWING AND 2 FOLLOWING
    ) FROM testjson ORDER BY id;
