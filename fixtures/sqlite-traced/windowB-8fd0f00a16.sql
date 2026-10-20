SELECT 
    json_group_array( v ) OVER w,
    json_group_array( v ) OVER w
  FROM t1
  window w as ( 
    range between unbounded preceding and unbounded following 
  )
