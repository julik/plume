SELECT path FROM fstree WHERE path NOT GLOB '*$*' LIMIT $num_root_files
