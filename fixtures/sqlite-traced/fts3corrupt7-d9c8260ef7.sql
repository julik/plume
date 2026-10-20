INSERT INTO fts_segdir
  (level, idx, start_block, leaves_end_block, end_block, root) VALUES
  (0, 0, 100, 100 + $DEPTH, 100 + $DEPTH, make_interior_node($DEPTH+1, 100));
