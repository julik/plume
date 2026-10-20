SELECT max((SELECT a FROM (SELECT count(*) AS a FROM ty) AS s)) FROM tx;
