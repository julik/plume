SELECT term, documents, occurrences FROM terms_v 
  WHERE rec('cnt', term) AND term BETWEEN 'brags' AND 'brain'
