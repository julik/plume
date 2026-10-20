SELECT * FROM 
  VirtualTableA a CROSS JOIN VirtualTableB b ON b.PrimaryKey=a.PrimaryKey
  WHERE a.ColumnA IN ('ValueA', 'ValueB') AND a.FlagA=0
