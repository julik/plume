INSERT INTO fts_segments(blockid, block) 
      VALUES($ii+100, make_interior_node($DEPTH-$ii, 101+$ii))
