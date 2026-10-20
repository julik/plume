WITH c(n) AS (SELECT ieee754_from_blob(x'0000000000000001'))
SELECT decimal(c.n) FROM c;
