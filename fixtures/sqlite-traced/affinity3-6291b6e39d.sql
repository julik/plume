CREATE VIEW v2rj AS
  SELECT c.id, v1.apr
  FROM v1 RIGHT JOIN customer c ON v1.id=c.id;
