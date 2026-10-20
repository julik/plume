CREATE VIRTUAL TABLE IF NOT EXISTS temp.t1
  USING csv(filename='FileDoesNotExist.csv');
