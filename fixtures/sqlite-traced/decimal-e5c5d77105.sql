SELECT decimal_cmp('3e-1','0.5'), decimal_cmp('0e1','0.5'),
         decimal_cmp('0.000001e34','1e28'), decimal_cmp('0e-10','0'),
         decimal_cmp(decimal('3e-1'), decimal('0.5'));
