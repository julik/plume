SELECT ('{a: "abc'||char(0x5c,0x0d)||'xyz"}')->>'a';
