SELECT max(b) OVER (ORDER BY max(c)) FROM ttt GROUP BY b;
