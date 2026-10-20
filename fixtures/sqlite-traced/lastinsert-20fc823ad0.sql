create trigger r1 instead of insert on v for each row begin
            insert into t2 values (NEW.k*2, last_insert_rowid(), NULL, NULL);
            update t2 set k=k+10, val2=100+last_insert_rowid();
            update t2 set val3=1000+last_insert_rowid();
        end;
