SELECT x FROM j1
   WHERE json_extract(x,'$')<>x
     AND json_type(x) IN ('object','array');
