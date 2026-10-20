SELECT a.value, b.value 
      FROM json_each('["a", "c", null]') AS b
           LEFT JOIN
           json_each('["a", "b", null]') AS a ON a.value = b.value;
