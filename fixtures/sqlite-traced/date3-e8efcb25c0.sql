WITH tx(timeval,datetime) AS (
     VALUES('2022-01-27 13:15:44','2022-01-27 13:15:44'),
           (2459607.05260275,'2022-01-27 13:15:44'),
           (1643289344,'2022-01-27 13:15:44')
  )
  SELECT datetime(timeval,'auto') == datetime FROM tx;
