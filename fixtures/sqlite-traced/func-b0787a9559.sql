WITH c(x) AS (VALUES(char(350,351,352,353,354)))
  SELECT length(x), octet_length(x) FROM c;
