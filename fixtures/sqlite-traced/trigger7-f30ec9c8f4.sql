CREATE TRIGGER not_a_db.r1 AFTER INSERT ON t1 BEGIN
      SELECT 'no nothing';
    END
