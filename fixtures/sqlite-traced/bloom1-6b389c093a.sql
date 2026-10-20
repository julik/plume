SELECT count(*) FROM big CROSS JOIN small
   WHERE small.k=big.b AND small.v<>'nope';
