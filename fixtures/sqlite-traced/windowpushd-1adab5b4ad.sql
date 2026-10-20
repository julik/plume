CREATE VIEW lll AS SELECT
    row_number() OVER (PARTITION BY grp_id), 
    grp_id, id 
  FROM t1
