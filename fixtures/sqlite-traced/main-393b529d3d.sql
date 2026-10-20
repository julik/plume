CREATE TRIGGER xyz AFTER DELETE backend BEGIN
         UPDATE pqr SET a=5;
         EXPLAIN select * from xyz;
