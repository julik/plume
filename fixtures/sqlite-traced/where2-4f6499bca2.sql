EXPLAIN QUERY PLAN 
    -- The + operator removes affinity from the rhs.  No conversions
    -- occur and the comparison is false.  The result is an empty set.
    --
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=+b;
