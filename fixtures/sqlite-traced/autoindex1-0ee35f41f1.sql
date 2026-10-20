explain query plan
  SELECT messages.ROWID,
         messages.message_id,
         messages.remote_id,
         messages.date_received,
         messages.date_sent,
         messages.flags,
         messages.size,
         messages.color,
         messages.date_last_viewed,
         messages.subject_prefix,
         subjects.subject,
         sender.comment,
         sender.address,
         NULL,
         messages.mailbox,
         messages.original_mailbox,
         NULL,
         NULL,
         messages.type,
         messages.document_id,
         sender,
         NULL,
         messages.conversation_id,
         messages.conversation_position,
         agglabels.labels
   FROM mailboxes AS mailbox
        JOIN messages ON mailbox.ROWID = messages.mailbox
        LEFT OUTER JOIN subjects ON messages.subject = subjects.ROWID
        LEFT OUTER JOIN addresses AS sender ON messages.sender = sender.ROWID
        LEFT OUTER JOIN (
               SELECT message_id, group_concat(mailbox_id) as labels
               FROM labels GROUP BY message_id
             ) AS agglabels ON messages.ROWID = agglabels.message_id
  WHERE (mailbox.url = 'imap://email.app@imap.gmail.com/%5BGmail%5D/All%20Mail')
    AND (messages.ROWID IN (
            SELECT labels.message_id
              FROM labels JOIN mailboxes ON labels.mailbox_id = mailboxes.ROWID
             WHERE mailboxes.url = 'imap://email.app@imap.gmail.com/INBOX'))
    AND messages.mailbox in (6,12,18,24,30,36,42,1,7,13,19,25,31,37,43,2,8,
                             14,20,26,32,38,3,9,15,21,27,33,39,4,10,16,22,28,
                             34,40,5,11,17,23,35,41)
   ORDER BY date_received DESC;
