SELECT DISTINCT aname
      FROM album, composer, track
     WHERE likelihood(cname LIKE '%bach%', track.cid)
       AND composer.cid=track.cid
       AND album.aid=track.aid;
