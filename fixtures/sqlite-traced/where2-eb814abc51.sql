EXPLAIN QUERY PLAN 
    -- Because a is type TEXT and b is type INTEGER, both a and b
    -- will attempt to convert to NUMERIC before the comparison.
    -- They will thus compare equal.
    --
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=b;
