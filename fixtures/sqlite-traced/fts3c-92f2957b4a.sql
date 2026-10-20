SELECT start_block, leaves_end_block, root 
            FROM t1_segdir WHERE level = 0 AND idx = 0
            ORDER BY level DESC, idx ASC
