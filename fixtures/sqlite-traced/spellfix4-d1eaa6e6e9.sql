SELECT md5sum(ed||'/'||sx||'/'||sy||',') FROM (
      SELECT editdist3(a.x,b.x) AS ed, a.x AS sx, b.x AS sy
        FROM words a, words b
       WHERE a.x<b.x
       ORDER BY 1, 2
  )
