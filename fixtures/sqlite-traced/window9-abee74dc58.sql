SELECT name, color,
    dense_rank() OVER (PARTITION BY name ORDER BY color)
  FROM fruits;
