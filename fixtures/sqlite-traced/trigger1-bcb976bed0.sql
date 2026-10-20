create trigger v1t AFTER update on v1 for each row begin
      delete from t1 WHERE a=old.a+2;
    end;
