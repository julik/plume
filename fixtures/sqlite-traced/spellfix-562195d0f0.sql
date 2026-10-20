SELECT rowid, word, matchlen FROM t1 WHERE word MATCH 'melotti'
   ORDER BY score LIMIT 3;
