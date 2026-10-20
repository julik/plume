SELECT (NULL, 'two', 'three') IN (
        SELECT a, b, c FROM t1
    ) IS NULL
