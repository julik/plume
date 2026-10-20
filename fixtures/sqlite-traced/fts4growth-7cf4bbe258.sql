SELECT sum(length(block)) FROM x2_segdir, x2_segments WHERE 
    blockid BETWEEN start_block AND leaves_end_block
    AND level=3
