UPDATE t1 SET memo = JSON_SET(memo, '$.y', 6)
    WHERE a2 IN (876) AND JSON_TYPE(memo, '$.y') IS NULL;
