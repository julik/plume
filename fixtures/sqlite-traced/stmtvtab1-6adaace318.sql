SELECT reprep,run,SQL FROM sqlite_stmt WHERE sql LIKE '%INSERT%' AND NOT busy;
