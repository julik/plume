SELECT word, distance, matchlen FROM demo WHERE 
  word MATCH 'amstedam*' AND top=3 AND distance <= 100
  ORDER BY +word;
