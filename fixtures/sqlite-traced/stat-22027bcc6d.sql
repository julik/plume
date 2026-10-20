SELECT name, quote(path), pageno, quote(pagetype), ncell, payload,
         unused, mx_payload, '|' FROM dbstat('main',1);
