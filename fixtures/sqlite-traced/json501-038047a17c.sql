WITH c(x) AS (VALUES('{x: 4.}')) SELECT x->>'x', json(x) FROM c;
