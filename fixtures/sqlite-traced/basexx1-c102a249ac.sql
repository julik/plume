SELECT len, base64(j.j||base64(b)||j.j)=b, base85(j.j||base85(b)||j.j)=b
  FROM rb r, junk j WHERE j.rank=(r.len+r.len/25)%3 ORDER BY len;
