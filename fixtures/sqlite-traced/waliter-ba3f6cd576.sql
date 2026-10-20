UPDATE t1 SET b = randomblob(900) WHERE a = ($ii%1000)+1;
