SELECT json(jsonb_set(jsonb('{"a":2,"c":4}'), '$.c', json_array(97,96)));
