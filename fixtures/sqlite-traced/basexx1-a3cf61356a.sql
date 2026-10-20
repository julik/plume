SELECT len, base64(base64(b))=b, base85(base85(b))=b
  FROM rb ORDER BY len;
