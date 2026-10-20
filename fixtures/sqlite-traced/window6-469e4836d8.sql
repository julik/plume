SELECT group_concat(following, '.') OVER (ORDER BY preceding) FROM over
