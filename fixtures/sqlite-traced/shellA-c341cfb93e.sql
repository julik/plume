INSERT INTO t1 VALUES
   (1, 'line with '' single quote'),
   (2, concat(char(0x1b),'[31mVT-100 codes',char(0x1b),'[0m')),
   (3, NULL),
   (4, 1234),
   (5, 568.25),
   (6, unistr('new\u000aline')),
   (7, unistr('carriage\u000dreturn')),
   (8, 'last line');
