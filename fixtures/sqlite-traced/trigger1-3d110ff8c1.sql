create trigger t1t instead of update on t1 for each row begin
      delete from t1 WHERE a=old.a+2;
    end;
