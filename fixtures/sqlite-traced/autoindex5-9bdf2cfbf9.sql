SELECT (
      SELECT sum(z) FROM vvv WHERE x='aaa'
  ) FROM one;
