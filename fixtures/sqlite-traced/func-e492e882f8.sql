SELECT coalesce(x, 'xyz' LIKE printf('%.1000000c','y')) FROM t1;
