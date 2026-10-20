CREATE VIEW y AS 
      SELECT x1.b AS p, x2.b AS q FROM x AS x1, x AS x2 WHERE x1.a=x2.a;
