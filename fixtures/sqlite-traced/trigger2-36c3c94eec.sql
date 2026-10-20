CREATE TRIGGER conditional_update_row AFTER UPDATE ON tbl FOR EACH ROW
        WHEN old.a = 1
        BEGIN
        INSERT INTO clog VALUES ( (SELECT coalesce(max(idx),0) + 1 FROM clog), 
  	  old.a, old.b, 
  	  (SELECT coalesce(sum(a),0) FROM tbl),
          (SELECT coalesce(sum(b),0) FROM tbl), 
  	  new.a, new.b);
      END;
