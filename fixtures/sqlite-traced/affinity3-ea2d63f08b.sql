CREATE VIEW idmap as
      SELECT * FROM map_integer
      UNION SELECT * FROM map_text;
