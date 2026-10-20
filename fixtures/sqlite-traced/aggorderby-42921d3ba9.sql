WITH c(x) AS (VALUES('abc'),('DEF'),('xyz'),('ABC'),('XYZ'))
  SELECT string_agg(x,',' ORDER BY x COLLATE nocase),
         string_agg(x,',' ORDER BY x) FROM c;
