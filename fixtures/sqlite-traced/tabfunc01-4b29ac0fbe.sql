SELECT 'value >= -9007199254740991.0' WHERE (
            SELECT group_concat(value) FROM generate_series (-9007199254740995,-9007199254740990)
             WHERE value >= -9007199254740991.0)<>(
            SELECT group_concat(value) FROM generate_series (-9007199254740995,-9007199254740990)
             WHERE +value >= -9007199254740991.0);
