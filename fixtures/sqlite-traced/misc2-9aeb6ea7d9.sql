CREATE VIEW z AS
      SELECT y1.p, y2.p FROM y AS y1, y AS y2 WHERE y1.q=y2.q;
