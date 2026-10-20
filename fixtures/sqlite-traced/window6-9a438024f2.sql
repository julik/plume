SELECT sum(following) OVER current FROM over WINDOW current AS (ORDER BY preceding)
