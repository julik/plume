SELECT group_concat(amount, ' ') FROM (SELECT amount FROM price ORDER BY amount);
