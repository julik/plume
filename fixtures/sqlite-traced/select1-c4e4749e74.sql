SELECT ifnull(a, max((SELECT 123))), count(a) FROM t1 ;
