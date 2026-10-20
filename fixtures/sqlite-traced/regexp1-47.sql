SELECT 'aaaabbbbcccc' REGEXP '^a(a|bb|c)+c$',
         'aaaabbbbcccc' REGEXP '^a(a|bbb|c)+c$',
         'aaaabbbbcccc' REGEXP '^a(a|bbbb|c)+c$'
