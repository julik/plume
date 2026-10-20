SELECT count(*) FROM demo 
  WHERE word MATCH 'amstedam*' AND distance <= 100 AND top=20;
