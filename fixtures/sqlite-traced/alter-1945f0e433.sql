INSERT INTO objlist SELECT type, name, tbl_name 
        FROM sqlite_master WHERE NAME!='objlist';
