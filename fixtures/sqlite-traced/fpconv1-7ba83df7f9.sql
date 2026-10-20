WITH RECURSIVE
       /* Number of random floating-point values to try.
       ** On a circa 2021 Ryzen 5950X running Mint Linux, and
       ** compiled with -O0 -DSQLITE_DEBUG, this test runs at
       ** about 150000 cases per second  ------------------vvvvvvv */
    c(x) AS (VALUES(1) UNION ALL SELECT x+1 FROM c WHERE x<500_000),
    fp(y) AS MATERIALIZED (
       SELECT CAST( format('%+d.%019d0e%+03d',
                           random()%10,abs(random()),random()%200) AS real)
        FROM c
    )
  SELECT y FROM fp
   WHERE -log10(abs(decimal_sub(dtostr(y,24),format('%!.24e',y))/y))<17.0;
