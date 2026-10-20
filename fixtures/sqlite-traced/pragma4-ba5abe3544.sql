SELECT t4.name, t3.name 
    FROM pragma_table_info('t4') t4 
    RIGHT JOIN pragma_table_info('t3') t3 ON (t4.name=t3.name);
