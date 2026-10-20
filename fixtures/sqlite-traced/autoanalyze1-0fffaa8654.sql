SELECT (flgs & 0x0100)!=0 FROM pragma_stats WHERE tbl='t1' AND idx IS NULL;
