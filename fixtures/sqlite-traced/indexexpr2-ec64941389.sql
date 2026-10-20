SELECT sqlite_master.name 
      FROM sqlite_master, explain('UPDATE t2 SET b=b+1')
     WHERE explain.opcode LIKE 'Open%'
       AND sqlite_master.rootpage=explain.p2
     ORDER BY 1;
