WITH RECURSIVE cnt(n) AS (VALUES(1) UNION ALL SELECT n+1 FROM cnt WHERE n<100)
  SELECT sum(length(next_char(
    printf('%.*c',1000000,'A'),
    'd',
    'substr(printf(''%.*c'',2000000,''A''),1,if(abs(random())%2=0,1000001,1))')))>0
    FROM cnt;
