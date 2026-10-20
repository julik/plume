SELECT hex(jsonb('"ab\' || char(10) || '"') ->> '$');
