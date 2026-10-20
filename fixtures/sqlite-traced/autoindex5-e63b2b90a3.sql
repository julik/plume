CREATE VIEW debian_cve AS
              SELECT DISTINCT debian_bugs.bug, st.bug_name
              FROM package_notes, debian_bugs, source_package_status AS st
              WHERE package_notes.bug_name = st.bug_name
              AND debian_bugs.note = package_notes.id
              ORDER BY debian_bugs.bug;
