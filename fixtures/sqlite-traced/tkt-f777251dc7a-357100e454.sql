SELECT x, force_rollback(), EXISTS(SELECT 1 FROM t3 WHERE w=x) FROM t2;
