SELECT DISTINCT user.name
    FROM user, json_each(user.phone)
   WHERE json_each.value LIKE '704-%'
   ORDER BY 1;
