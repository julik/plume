INSERT INTO transactions
  SELECT
      nullif(debit, '') AS debit,
      nullif(credit, '') AS credit
  FROM csv_import_table;
