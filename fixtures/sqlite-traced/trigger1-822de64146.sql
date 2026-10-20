create trigger v1t before update on v1 for each row begin
      delete from t1 WHERE a=old.a+2;
    end;
