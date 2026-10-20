SELECT * FROM 
  VirtualTableA a CROSS JOIN VirtualTableB b ON b.PrimaryKey=a.PrimaryKey
  WHERE a.FlagA=0 AND a.ColumnA IN ('ValueA', 'ValueB')
