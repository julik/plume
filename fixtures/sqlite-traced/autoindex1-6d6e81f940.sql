CREATE TABLE flock_owner(
    owner_rec_id INTEGER CONSTRAINT flock_owner_key PRIMARY KEY,
    flock_no VARCHAR(6) NOT NULL REFERENCES flock (flock_no),
    owner_person_id INTEGER NOT NULL REFERENCES person (person_id),
    owner_change_date TEXT, last_changed TEXT NOT NULL,
    CONSTRAINT fo_owner_date UNIQUE (flock_no, owner_change_date)
  );
