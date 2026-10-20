SELECT 
    json_group_array(c) OVER win4 
  FROM t1
    WINDOW win4 AS (
        ORDER BY a COLLATE nocase RANGE BETWEEN 1.0 PRECEDING AND CURRENT ROW
    )
