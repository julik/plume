CREATE TABLE node(
      id int not null primary key, 
      pid int not null default 0 references node,
      key varchar not null, 
      path varchar default '',
      unique(pid, key)
      );
