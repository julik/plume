/* Long list on the RHS of IN */
   SELECT 15 IN (1,2,3,(SELECT * FROM t1),'xyz',x'abcd',22*(x+5),null);
