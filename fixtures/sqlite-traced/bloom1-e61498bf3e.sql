SELECT count(*) FROM big2, small2
   WHERE small2.k=big2.b AND small2.v<>'nope';
