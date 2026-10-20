SELECT coalesce(max(quote(a)),10) FROM t1 GROUP BY a;
