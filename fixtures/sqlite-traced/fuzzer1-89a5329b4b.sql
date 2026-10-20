SELECT word, distance FROM x5 WHERE word MATCH 
    'aaaaaaaaaXaaaaaaaaaXaaaaaaaaaXaaaaaaaaaXaaaaaaaaa' || 
    'aaaaaaaaaXaaaaaaaaaXaaaaaaaaaXaaaaaaaaaXaaaaaaaaa' || 
    'aaaaaaaaaXaaaaaaaaaXaaaaaaaaaXaaaaaaaaaXaaaaaaaaa'
