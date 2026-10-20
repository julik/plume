SELECT max((SELECT a FROM (SELECT count(x) AS a FROM t35b))) FROM t35a;
