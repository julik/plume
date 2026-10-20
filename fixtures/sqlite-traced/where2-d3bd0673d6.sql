EXPLAIN QUERY PLAN 
    -- Use + on both sides of the comparison to disable indices
    -- completely.  Make sure we get the same result.
    --
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE +a=+b;
