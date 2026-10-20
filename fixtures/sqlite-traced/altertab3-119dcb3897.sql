SELECT type, name, tbl_name, sql 
  FROM sqlite_master WHERE type='table' AND name!='t1';
