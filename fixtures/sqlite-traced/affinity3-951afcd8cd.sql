CREATE VIEW v1 AS
  SELECT c.id, i.apr
  FROM customer c
  LEFT JOIN apr i ON i.id=c.id;
