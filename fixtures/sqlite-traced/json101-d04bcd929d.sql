INSERT INTO J2b(id,json,src) SELECT id, jsonb(json), src FROM j2;
