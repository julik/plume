SELECT a.value, b.value 
      FROM json_each('["a", "b", null]') AS a
           RIGHT JOIN
           b ON a.value = b.value;
