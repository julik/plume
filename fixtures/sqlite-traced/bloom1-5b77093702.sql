SELECT 'val' in (
      select 'val' from ( select 'valueB' from t1 order by 1 ) 
      union all 
      select 'val'
  );
