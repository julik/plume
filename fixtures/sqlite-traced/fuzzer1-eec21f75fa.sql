SELECT cFrom, cTo, word 
    FROM x3 CROSS JOIN x3_rules
    WHERE word MATCH 'a' AND cost=distance AND ruleset=2
    ORDER BY +cTo DESC
