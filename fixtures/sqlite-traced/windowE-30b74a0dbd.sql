select c1, max(c2) over (order by c1 range 366.0 preceding) from t2;
