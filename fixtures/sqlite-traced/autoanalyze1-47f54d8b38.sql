-- Verify that the hasStat1 flag is clear on on indexes
  SELECT idx, flgs FROM pragma_stats
   WHERE idx IS NOT NULL
   ORDER BY idx;
