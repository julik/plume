SELECT big.rowid, fullkey, value
    FROM big, json_tree(jsonb(big.json))
   WHERE json_tree.type NOT IN ('object','array')
   ORDER BY +big.rowid, +json_tree.id
