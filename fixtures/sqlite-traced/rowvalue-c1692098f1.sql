SELECT (SELECT +bb,1) >= (aa, 1), (aa,1)<=(SELECT +bb,1) FROM t0;
