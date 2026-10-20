WITH c(n) AS (SELECT ieee754_from_blob(x'0000000000000001'))
SELECT decimal_mul(ieee754_mantissa(c.n),pow2.v)
  FROM pow2, c WHERE pow2.x=ieee754_exponent(c.n);
