EXPLAIN QUERY PLAN
  SELECT
     t1_id,
     t1.did,
     param2,
     param3,
     t1.ptime,
     t1.trange,
     t1.exmass,
     t1.mass,
     t1.vstatus,
     type,
     subtype,
     t1.deviation,
     t1.formula,
     dparam1,
     reserve1,
     reserve2,
     param4,
     t1.last_operation,
     t1.admin_uuid,
     t1.previous_value,
     t1.job_id,
     client_did, 
     t1.last_t1,
     t1.data_t1,
     t1.previous_date,
     param5,
     param6,
     mgr_uuid
  FROM
     t1,
     t2,
     t3
  WHERE
     t1.ptime > 1393520400
     AND param3<>9001
     AND t3.flg7 = 1
     AND t1.did = t2.did
     AND t2.uid = t3.uid
  ORDER BY t1.ptime desc LIMIT 500;
