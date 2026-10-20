SELECT coalesce(b, 'null') || '/' || c FROM t8 x ORDER BY x.b, x.c
