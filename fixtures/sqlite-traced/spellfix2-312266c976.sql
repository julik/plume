SELECT word, distance, matchlen FROM demo 
  WHERE word MATCH 'amstedam*' AND distance <= 100 AND top=20
  ORDER BY distance, word;
