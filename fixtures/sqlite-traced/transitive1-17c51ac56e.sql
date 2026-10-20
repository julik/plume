CREATE VIEW episodeview
  AS
    SELECT episode.*,
           files.strfilename           AS strFileName,
           path.strpath                AS strPath,
           files.playcount             AS playCount,
           files.lastplayed            AS lastPlayed,
           files.dateadded             AS dateAdded,
           tvshow.c00                  AS strTitle,
           tvshow.c14                  AS strStudio,
           tvshow.c05                  AS premiered,
           tvshow.c13                  AS mpaa,
           tvshow.c16                  AS strShowPath,
           bookmark.timeinseconds      AS resumeTimeInSeconds,
           bookmark.totaltimeinseconds AS totalTimeInSeconds,
           seasons.idseason            AS idSeason
    FROM   episode
           JOIN files
             ON files.idfile = episode.idfile
           JOIN tvshow
             ON tvshow.idshow = episode.idshow
           LEFT JOIN seasons
                  ON seasons.idshow = episode.idshow
                     AND seasons.season = episode.c12
           JOIN path
             ON files.idpath = path.idpath
           LEFT JOIN bookmark
                  ON bookmark.idfile = episode.idfile
                     AND bookmark.type = 1;
