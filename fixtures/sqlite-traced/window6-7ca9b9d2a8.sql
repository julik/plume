SELECT sum(filter.following) OVER current FROM over filter WINDOW current AS (ORDER BY preceding)
