SELECT c FROM hh WHERE (a, b) = (SELECT 'abc', 1) COLLATE nocase;
