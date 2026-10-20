SELECT 'abc$¢€xyz' REGEXP '^abc\u0024\u00a2\u20acxyz$',
         'abc$¢€xyz' REGEXP '^abc\u0024\u00A2\u20ACxyz$',
         'abc$¢€xyz' REGEXP '^abc\x24\xa2\u20acxyz$'
