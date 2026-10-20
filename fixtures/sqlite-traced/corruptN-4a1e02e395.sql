-- Run an UPDATE on t1 that will hit a child of page 136. Have the trigger
  -- clear page 136 and its children. Assert fails.
  UPDATE t1 SET x='hello world' WHERE rowid=1;
