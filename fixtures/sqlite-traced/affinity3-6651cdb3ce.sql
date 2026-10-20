CREATE VIEW v1rj AS
  SELECT c.id, i.apr
  FROM apr i
  RIGHT JOIN customer c ON i.id=c.id;
