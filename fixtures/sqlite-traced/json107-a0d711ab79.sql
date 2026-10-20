SELECT key, value FROM json_tree( CAST('{"a":123,"b":456}' AS blob) )
      WHERE atom;
