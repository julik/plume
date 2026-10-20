WITH RECURSIVE c AS NOT MATERIALIZED (
       WITH RECURSIVE c AS NOT MATERIALIZED (
          WITH RECURSIVE c AS NOT MATERIALIZED (
             WITH RECURSIVE c AS NOT MATERIALIZED (
                 WITH  c AS (VALUES(0))
                 SELECT 1 FROM c LEFT JOIN c ON ltrim(1)
             )
             SELECT 1 FROM c,c,c,c,c,c,c,c,c
          )
          SELECT  2 FROM c,c,c,c,c,c,c,c,c
       )
       SELECT 3 FROM c,c,c,c,c,c,c,c,c
    )
    SELECT 4 FROM c,c,c,c,c,c,c,c,c;
