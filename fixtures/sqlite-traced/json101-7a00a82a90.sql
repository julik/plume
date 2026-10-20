SELECT json(x) FROM j1b
   WHERE json_extract(x,'$')<>json(x)
     AND json_type(x) IN ('object','array');
