UPDATE sqlite_schema
       SET sql=replace(sql,'abs(a)','nosuchfunc(a)')
     WHERE name='v1';
