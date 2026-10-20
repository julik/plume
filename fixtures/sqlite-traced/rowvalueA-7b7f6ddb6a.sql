SELECT c FROM t33 WHERE CASE WHEN 1
      THEN (a, b) = (SELECT 'abc' COLLATE nocase, 1)
      ELSE (a, b) = (SELECT 'abc' COLLATE nocase, 1)
    END;
