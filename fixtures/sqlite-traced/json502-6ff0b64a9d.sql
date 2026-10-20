SELECT json_patch('{"a\x62c":123}','{"ab\x63":456}') ->> 'abc';
