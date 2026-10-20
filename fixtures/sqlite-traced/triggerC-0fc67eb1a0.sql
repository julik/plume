CREATE TRIGGER node_delete_referencing AFTER DELETE ON "node"
    BEGIN
    DELETE FROM "node" WHERE pid = old."id";
  END;
