DELETE FROM t1 WHERE a<>'xray' RETURNING a, b, '@';
