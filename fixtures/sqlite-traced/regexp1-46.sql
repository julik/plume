SELECT 'aaaabbbbcccc' REGEXP 'a(a|b|c)+c',
         'aaaabbbbcccc' REGEXP '^a(a|b|c){11}c$',
         'aaaabbbbcccc' REGEXP '^a(a|b|c){10}c$',
         'aaaabbbbcccc' REGEXP '^a(a|b|c){9}c$'
