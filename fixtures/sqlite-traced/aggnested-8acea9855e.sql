SELECT sum(amount), name
    from invoice
  group by name
  having (select v > 6 from (select sum(amount) v) t)
