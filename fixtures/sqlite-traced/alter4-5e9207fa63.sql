CREATE TRIGGER add_stock AFTER INSERT ON incoming BEGIN
    INSERT INTO inv(sku, qty) VALUES (new.sku, new.qty)
      ON CONFLICT(sku) DO UPDATE SET qty=qty+excluded.qty WHERE excluded.qty>0;
  END;
