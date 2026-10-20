SELECT typeof(jsonb_set('[0x1F]', '$[1]', 2)),
         json_valid(jsonb_set('[0x1F]', '$[1]', 2),6);
