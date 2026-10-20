/* Shallow enough to be parsed { */
  SELECT json_valid(replace(printf('%.1000c0%.1000c','[','}'),'[','{"a":'));
