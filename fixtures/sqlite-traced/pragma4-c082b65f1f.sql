SELECT t.name, f."table", f."from", i.name, i.pk
      FROM pragma_table_list() AS t
           JOIN pragma_foreign_key_list(t.name, t.schema) AS f
           JOIN pragma_table_info(f."table", t.schema) AS i
     WHERE i.pk;
