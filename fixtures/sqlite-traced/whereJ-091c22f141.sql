EXPLAIN QUERY PLAN
  SELECT
     px.name,
     px.description
  FROM
     le,
     cx,
     px
  WHERE
     cx.code = '2990'
     AND cx.type=2
     AND px.cx_id = cx.cx_id
     AND px.px_tid = 0
     AND px.le_id = le.le_id;
