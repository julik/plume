SELECT start_block, leaves_end_block, root 
            FROM t1_segdir WHERE 1
            ORDER BY level DESC, idx ASC
