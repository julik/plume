SELECT json_extract(CAST('{"a":123}' AS blob), '$.a');
