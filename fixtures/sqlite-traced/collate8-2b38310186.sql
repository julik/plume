SELECT 'abc'==('ABC'||CASE WHEN 1+1=2 THEN '' COLLATE nocase
                                        ELSE '' COLLATE binary END);
