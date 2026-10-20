-- Verify that the TF_HasStat1 flag is clear on the table
  SELECT tbl, (flgs & 0x10)!=0 FROM pragma_stats WHERE tbl='t1' AND idx IS NULL;
