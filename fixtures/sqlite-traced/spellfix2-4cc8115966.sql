SELECT word, distance, matchlen FROM demo 
  WHERE word MATCH 'amstedam*' AND top=3
  ORDER BY +word;
