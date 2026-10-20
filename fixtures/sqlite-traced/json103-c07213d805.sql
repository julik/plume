SELECT json_group_object(rowid, x) OVER (ROWS 2 PRECEDING) FROM t4;
