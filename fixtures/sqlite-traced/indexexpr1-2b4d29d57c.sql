SELECT u.tag, v.max_value
    FROM (SELECT tag FROM t1 GROUP BY -tag) u
    JOIN (SELECT t1.tag AS "tag", t2.type AS "type",
                 MAX(t2.value) AS "max_value"
            FROM t1
                 JOIN t2 ON t2.t1_id = t1.id
           GROUP BY t2.type, t1.tag
         ) v ON v.type = 0 AND v.tag = u.tag;
