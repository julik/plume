UPDATE tclvar SET value = value || 't' 
  WHERE name = 'xx' OR name = 'x'||'x';
