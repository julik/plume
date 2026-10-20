create temp trigger r2 instead of insert on v2 for each row begin
            insert into n2 values (NULL, changes());
            insert into t2 values (1000+NEW.k);
            insert into n2 values (NULL, changes());
            update t0 set x=x*100 where x=0;
            insert into n2 values (NULL, changes());
            delete from t0 where x=2;
            insert into n2 values (NULL, changes());
        end;
