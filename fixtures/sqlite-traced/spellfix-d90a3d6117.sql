SELECT word, matchlen FROM t1 WHERE word MATCH $word 
     ORDER BY score, word LIMIT 5
