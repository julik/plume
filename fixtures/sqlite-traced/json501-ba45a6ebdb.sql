WITH json(jid,jx) AS (VALUES
    (1,'{"a":"text","b":123,"c":[1,2,3,"t",{"cc":99,"dd":100}],"d":null}'),
    (2,'[1,"a",{"aa":11,"bb":[9,8,7]},null]')
  ), paths(pid,px) AS (VALUES(1,'$.c[4]'),(2,'$.c'),(3,'$[2].bb'),(4,'$[2]'))
  SELECT jj.key, typeof(jj.key) FROM json, paths, json_tree(jx,px) AS jj
   WHERE parent IS NULL
   ORDER BY jid, pid;
