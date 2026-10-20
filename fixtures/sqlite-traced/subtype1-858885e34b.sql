SELECT *, json_quote(y) FROM (SELECT +json('1') AS y)
   WHERE json_quote(y)='"1"';
