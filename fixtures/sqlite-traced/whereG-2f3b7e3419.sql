SELECT unlikely(t0.rowid <= '0'),
         likely(t0.rowid <= '0'),
         likelihood(t0.rowid <= '0',0.5)
    FROM t0;
