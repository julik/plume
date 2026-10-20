CREATE VIEW tvshowview
  AS
    SELECT tvshow.*,
           path.strpath                              AS strPath,
           path.dateadded                            AS dateAdded,
           Max(files.lastplayed)                     AS lastPlayed,
           NULLIF(Count(episode.c12), 0)             AS totalCount,
           Count(files.playcount)                    AS watchedcount,
           NULLIF(Count(DISTINCT( episode.c12 )), 0) AS totalSeasons
    FROM   tvshow
           LEFT JOIN tvshowlinkpath
                  ON tvshowlinkpath.idshow = tvshow.idshow
           LEFT JOIN path
                  ON path.idpath = tvshowlinkpath.idpath
           LEFT JOIN episode
                  ON episode.idshow = tvshow.idshow
           LEFT JOIN files
                  ON files.idfile = episode.idfile
    GROUP  BY tvshow.idshow;
