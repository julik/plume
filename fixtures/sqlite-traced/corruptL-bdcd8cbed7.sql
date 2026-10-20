UPDATE sqlite_master SET rootpage = (
    SELECT rootpage FROM sqlite_master WHERE name='t1idx'
  ) WHERE type = 'index';
