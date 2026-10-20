WITH t400(id,j) AS (VALUES
    (1,'{a:{x:1,y:2},b:{x:3,y:4}}'),
    (2,'not json')
  )
  SELECT id, subtype(if(json_valid(j,6),j->'a')) FROM t400;
