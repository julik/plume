CREATE VIEW test41(x) AS SELECT json_extract('{"a":123}','$.a');
