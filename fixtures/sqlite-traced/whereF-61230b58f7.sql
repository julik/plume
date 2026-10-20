SELECT * FROM t
     WHERE(EXISTS(SELECT 1 FROM json_each(t.json,"$.foo") j
                   WHERE j.value = 'meep'));
