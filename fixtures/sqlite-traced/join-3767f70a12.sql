SELECT a.value, b.value 
      FROM a
           RIGHT JOIN
           json_each('["a", "c", null]') AS b ON a.value = b.value;
