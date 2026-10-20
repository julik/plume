SELECT editdist3(a.x,b.x), a.x, b.x
    FROM words a, words b
   WHERE a.x<b.x
   ORDER BY 1, 2
   LIMIT 20
