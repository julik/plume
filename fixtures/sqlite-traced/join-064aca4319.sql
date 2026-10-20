INSERT INTO a(value) SELECT value FROM json_each('["a", "b", null]');
