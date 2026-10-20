SELECT * FROM t1
   WHERE ('B' COLLATE nocase,'abc')>(a,b)
   ORDER BY +a;
