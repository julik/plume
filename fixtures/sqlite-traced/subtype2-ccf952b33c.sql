SELECT json_group_object( 'key', (SELECT CAST(json(0) AS TEXT)) );
