WITH RECURSIVE
    c(x,s) AS MATERIALIZED (VALUES(1,random()&0xffefffffffffffff)
               UNION ALL
               SELECT x+1,random()&0xffefffffffffffff
                 FROM c WHERE x<1_000_000),
    fp(y,s) AS (
       SELECT ieee754_from_int(s),s FROM c
    ),
    fp2(yt,y,s) AS (
       SELECT y||'', y, s FROM fp
    )
  SELECT format('%#016x',s) aS 'orig-hex',
         format('%#016x',ieee754_to_int(CAST(yt AS real))) AS 'full-roundtrip',
         yt AS 'rendered-as',
         decimal_exp(yt,30) AS 'text-decimal',
         decimal_exp(ieee754_from_int(s),30) AS 'float-decimal'
    FROM fp2
   WHERE ieee754_to_int(CAST(yt AS real))<>s;
