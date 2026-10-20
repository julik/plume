CREATE/**/TRIGGER tiger00 AFTER DELETE backend BEGIN
         UPDATE pqr SET a=5;
