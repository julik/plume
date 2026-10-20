UPDATE sqlite_dbpage SET data=(SELECT x FROM saved_content)
   WHERE pgno=2 AND schema='aux1';
