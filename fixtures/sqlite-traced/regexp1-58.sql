SELECT 'abc$¢€xyz' REGEXP '^abc[\u0024][\u00a2][\u20ac]xyz$',
         'abc$¢€xyz' REGEXP '^abc[\u0024\u00A2\u20AC]{3}xyz$',
         'abc$¢€xyz' REGEXP '^abc[\x24][\xa2\u20ac]+xyz$'
