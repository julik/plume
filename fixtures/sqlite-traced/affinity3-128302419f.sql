CREATE VIEW v2 AS
  SELECT c.id, v1.apr
  FROM customer c
  LEFT JOIN v1 ON v1.id=c.id;
