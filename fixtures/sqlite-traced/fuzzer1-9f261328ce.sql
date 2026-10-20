SELECT word FROM x3_rules, x3 
  WHERE word MATCH x3_rules.cFrom 
    AND ruleset=2 
    AND x3_rules.cost=8;
