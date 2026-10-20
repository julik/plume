SELECT * FROM t1 NOT INDEXED
   WHERE ('B' COLLATE nocase,'abc')>(a,b)
   ORDER BY +a;
