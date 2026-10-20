SELECT a,b,c,tx.v AS 'v-a', ty.v AS 'v-b'
    FROM t1 LEFT JOIN t2 AS tx ON tx.k=a
            LEFT JOIN t2 AS ty ON ty.k=b
   ORDER BY c;
