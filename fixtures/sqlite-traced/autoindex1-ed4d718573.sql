EXPLAIN QUERY PLAN
  SELECT * FROM 
        data JOIN mimetypes ON (data.mimetype_id=mimetypes._id) 
             JOIN raw_contacts ON (data.raw_contact_id=raw_contacts._id) 
             JOIN accounts ON (raw_contacts.account_id=accounts._id)
   WHERE mimetypes._id=10 AND data14 IS NOT NULL;
