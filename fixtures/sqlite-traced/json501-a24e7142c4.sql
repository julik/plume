SELECT jsonb('{label:"abc' || char($c) || 'xyz"}') -> '$';
