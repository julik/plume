UPDATE user
     SET phone=json_extract(phone,'$[0]')
   WHERE json_array_length(phone)<2;
