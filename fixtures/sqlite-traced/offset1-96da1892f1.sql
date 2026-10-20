CREATE VIEW v AS
    SELECT * FROM (
      SELECT * FROM employees 
       WHERE salary < 100
       ORDER BY salary desc)
     UNION ALL 
     SELECT * FROM (
       SELECT * FROM employees
       WHERE salary >= 100
       ORDER BY salary asc);
