CREATE VIEW ttt AS
        WITH xyz(x) AS (SELECT col1 FROM log_entry)
        SELECT x FROM xyz;
