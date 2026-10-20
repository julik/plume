SELECT a.value, b.value 
      FROM json_each('["a", "b", null]') AS a
           RIGHT JOIN
           json_each('["a", "c", null]') AS b ON a.value = b.value;
