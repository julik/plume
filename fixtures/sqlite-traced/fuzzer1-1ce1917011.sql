SELECT word, distance FROM x3, t1 
    WHERE x3.word MATCH t1.a AND ruleset=2 AND distance=t1.b;
