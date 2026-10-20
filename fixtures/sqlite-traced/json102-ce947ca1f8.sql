SELECT json_set('[0x1F]', '$[1]', 2),
         json_valid(' '||json_set('[0x1F]', '$[1]', 2));
