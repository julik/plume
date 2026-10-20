CREATE TRIGGER trig AFTER DELETE ON t_sa
   BEGIN
   DELETE FROM t_sa WHERE (
       SELECT 123 FROM t2
       WINDOW oamat7fzf AS ( PARTITION BY t_sa.c_d4u )
   );
   END;
