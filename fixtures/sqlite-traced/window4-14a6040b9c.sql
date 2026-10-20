SELECT abs(max(b) OVER (ORDER BY b)) FROM ttt GROUP BY b;
