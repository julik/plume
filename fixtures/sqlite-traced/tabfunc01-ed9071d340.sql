select 1 as c_0
    from        
    generate_series(1, 1) as ref_3
    where (ref_3.value) in (select 1);
