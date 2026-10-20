CREATE TRIGGER tr1 INSTEAD OF UPDATE ON v1 BEGIN
    INSERT INTO log VALUES(
      '('||old.a||','||old.__hidden__b||')->('||new.a||','||new.__hidden__b||')'
    );
  END;
