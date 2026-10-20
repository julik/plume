with v as (
      select sl.id as id
      from tt
      left join pr on pr.k = tt.k
      join sl on sl.dk = tt.id
  )
  select count(*) from probe join v on v.id = probe.id;
