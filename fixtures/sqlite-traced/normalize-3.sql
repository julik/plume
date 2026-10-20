/*Initial comment*/
   -- another comment line
   SELECT NULL  /* comment */ , b FROM t1 -- comment text
     WHERE d IN (WITH t(a) AS (VALUES(5)) /* CTE */
                 SELECT a FROM t)
        OR e='hello';
