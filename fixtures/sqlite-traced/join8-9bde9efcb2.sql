SELECT quote(a.key), b.value
    FROM a RIGHT JOIN json_each('["a","c"]') AS b ON a.key=b.value;
