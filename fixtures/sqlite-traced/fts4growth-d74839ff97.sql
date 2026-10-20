UPDATE x2_segdir SET end_block = CAST( first(end_block) AS INTEGER );
