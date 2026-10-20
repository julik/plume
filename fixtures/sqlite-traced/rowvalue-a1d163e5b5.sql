SELECT c FROM hh WHERE (a COLLATE nocase, b) = (SELECT 'def', 2);
