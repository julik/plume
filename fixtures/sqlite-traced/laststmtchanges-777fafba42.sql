create trigger r1 after update on t1 for each row begin
            insert into t2 values (NULL, changes(), NULL);
            delete from t0 where oid=1 or oid=2;
            update t2 set v2=changes();
        end;
