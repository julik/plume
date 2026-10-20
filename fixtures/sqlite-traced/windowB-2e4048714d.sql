SELECT sum(value) OVER (ORDER BY rowid) FROM json_each('[1,2,3,4,5]')
