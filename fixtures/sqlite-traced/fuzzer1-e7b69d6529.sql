SELECT cFrom, cTo, word 
    FROM x3_rules CROSS JOIN x3 
    WHERE word MATCH 'a' AND cost=distance AND ruleset=2
    ORDER BY +cTo;
