SELECT(
    WITH c AS(
      VALUES(1)
    ) SELECT '' FROM c,c
  ) x WHERE x+x;
