SELECT y, y+1, y+2 FROM (
      SELECT c IN (
        SELECT min(a) OVER (),
        (abs(row_number() OVER())+22)/19,
        max(a) OVER () FROM t1
        ) AS y FROM t2
      );
