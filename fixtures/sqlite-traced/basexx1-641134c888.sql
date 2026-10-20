WITH RECURSIVE c(n) AS (VALUES(1) UNION ALL SELECT n+1 FROM c wHERE n<5000)
  SELECT sum(length(base64(randomblob(n)))) FROM c;
