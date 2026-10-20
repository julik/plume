SELECT is_base85(' '||base85(x'123456')||char(10)),
  is_base85('#$%&*+,-./0123456789:;<=>?@'
   ||'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
   ||'[\]^_`'
   ||'abcdefghijklmnopqrstuvwxyz'),
  is_base85('!'), is_base85('"'), is_base85(''''), is_base85('('),
  is_base85(')'), is_base85(char(123)), is_base85('|'), is_base85(char(125)),
  is_base85('~'), is_base85(char(127));
