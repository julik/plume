SELECT word, distance, matchlen FROM demo WHERE 
  word MATCH 'amstedam*' AND distance <= 100
  ORDER BY +word;
