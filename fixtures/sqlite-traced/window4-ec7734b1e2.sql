SELECT max(c), max(b) OVER (ORDER BY b) FROM ttt GROUP BY b;
