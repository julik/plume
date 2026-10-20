SELECT json_insert(CAST('{"a":123}' AS blob),'$.b',456);
