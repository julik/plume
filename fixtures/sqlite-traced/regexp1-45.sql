SELECT 'aaaabbbbbbcccc' REGEXP 'ab{3,5}c',
         'aaaabbbbbcccc' REGEXP 'ab{3,5}c',
         'aaaabbbbcccc' REGEXP 'ab{3,5}c',
         'aaaabbbcccc' REGEXP 'ab{3,5}c',
         'aaaabbcccc' REGEXP 'ab{3,5}c',
         'aaaabcccc' REGEXP 'ab{3,5}c'
