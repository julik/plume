CREATE TABLE labels (ROWID INTEGER PRIMARY KEY, message_id INTEGER NOT NULL, mailbox_id INTEGER NOT NULL, UNIQUE(message_id, mailbox_id));
