SELECT term, documents, occurrences FROM terms_v 
  WHERE rec('cnt', term) AND +term > 'brags' AND +term < 'brain'
