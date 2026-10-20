create temp trigger r1 instead of insert on v1 for each row begin
            insert into n1 values (NULL, changes());
            update t0 set x=x*10 where x=1;
            insert into n1 values (NULL, changes());
            insert into t1 values (NEW.k);
            insert into n1 values (NULL, changes());
            update t0 set x=x*10 where x=0;
            insert into v2 values (100+NEW.k);
            insert into n1 values (NULL, changes());
        end;
