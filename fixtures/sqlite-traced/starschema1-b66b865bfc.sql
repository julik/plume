EXPLAIN QUERY PLAN
  SELECT c01, c02, c03, c04, c05, c06, c07, c08,
         c09, c10, c11, c12, c13, c14, c15, c16,
         c17, c18, c19, c20, c21, c22, c23, c24,
         c25, c26, c27, c28, c29, c30, c31, c32
    FROM t1, x01, x02, x03, x04, x05, x06, x07, x08,
             x09, x10, x11, x12, x13, x14, x15, x16,
             x17, x18, x19, x20, x21, x22, x23, x24,
             x25, x26, x27, x28, x29, x30, x31, x32
   WHERE a01=b01 AND a02=b02 AND a03=b03 AND a04=b04 AND a05=b05 AND a06=b06
     AND a07=b07 AND a08=b08 AND a09=b09 AND a10=b10 AND a11=b11 AND a12=b12
     AND a13=b13 AND a14=b14 AND a15=b15 AND a16=b16 AND a17=b17 AND a18=b18
     AND a19=b19 AND a20=b20 AND a21=b21 AND a22=b22 AND a23=b23 AND a24=b24
     AND a25=b25 AND a26=b26 AND a27=b27 AND a28=b28 AND a29=b29 AND a30=b30
     AND a31=b31 AND a32=b32;
