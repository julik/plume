SELECT sum(value) OVER (ORDER BY value ASC) FROM json_each('[2,1,4,3,5]')
