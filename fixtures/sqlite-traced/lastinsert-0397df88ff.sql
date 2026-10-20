create temp trigger r2 instead of insert on v2 for each row begin
            update rid set rin=last_insert_rowid() where k=2;
            insert into t2 values (1000+NEW.k);
            update rid set rout=last_insert_rowid() where k=2;
        end;
