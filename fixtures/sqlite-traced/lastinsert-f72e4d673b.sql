create temp trigger r1 instead of insert on v1 for each row begin
            update rid set rin=last_insert_rowid() where k=1;
            insert into t1 values (100+NEW.k);
            insert into v2 values (100+last_insert_rowid());
            update rid set rout=last_insert_rowid() where k=1;
        end;
