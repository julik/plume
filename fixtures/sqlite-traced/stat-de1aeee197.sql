INSERT INTO t3 SELECT a_string(110+rowid), a_string(221+rowid) FROM t3
   ORDER BY rowid;
