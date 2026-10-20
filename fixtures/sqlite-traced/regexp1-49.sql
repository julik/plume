SELECT 'abc*def+ghi.jkl[mno]pqr' REGEXP 'c.d',
         'abc*def+ghi.jkl[mno]pqr' REGEXP 'c\*d',
         'abc*def+ghi.jkl[mno]pqr' REGEXP 'f\+g',
         'abc*def+ghi.jkl[mno]pqr' REGEXP 'i\.j',
         'abc*def+ghi.jkl[mno]pqr' REGEXP 'l\[mno\]p'
