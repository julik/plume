create trigger r1 after insert on t1 for each row begin
            insert into t2 values (NULL, changes(), NULL);
            update t0 set x=x;
            update t2 set v2=changes();
        end;
