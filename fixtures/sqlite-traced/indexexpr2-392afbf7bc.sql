SELECT 'TWOX' == (b || 'x') COLLATE nocase  FROM t1 WHERE (b || 'x')>'onex'
