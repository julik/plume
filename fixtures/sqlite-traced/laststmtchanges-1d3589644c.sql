create trigger r1 before delete on t1 for each row begin
            insert into t2 values (NULL, changes(), NULL);
            insert into t0 values (5);
            update t2 set v2=changes();
        end;
