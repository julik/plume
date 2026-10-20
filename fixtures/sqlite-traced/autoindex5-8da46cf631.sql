CREATE UNIQUE INDEX package_notes_bug
              ON package_notes(bug_name, package, release);
