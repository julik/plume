SELECT j, j->>0, j->>1
    FROM (SELECT json_set('[]','$[#]',0,'$[#]',1) AS j);
