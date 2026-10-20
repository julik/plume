INSERT INTO objlist SELECT type, name, tbl_name 
          FROM temp.sqlite_master WHERE NAME!='objlist';
