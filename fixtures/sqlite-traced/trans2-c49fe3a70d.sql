UPDATE t1 SET u1=u1||'x',
          z = CASE WHEN id<$max_rowid
                   THEN zeroblob((random()&65535)%5000 + 1000) END;
