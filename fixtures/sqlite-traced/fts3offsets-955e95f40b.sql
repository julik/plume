SELECT oid,extract(offsets(xx), x) FROM xx WHERE xx MATCH 'a OR (b NEAR/1 c)';
