SELECT
    episodeview.c12,
    path.strPath,
    tvshowview.c00,
    tvshowview.c01,
    tvshowview.c05,
    tvshowview.c08,
    tvshowview.c14,
    tvshowview.c13,
    seasons.idSeason,
    count(1),
    count(files.playCount)
  FROM episodeview
      JOIN tvshowview ON tvshowview.idShow = episodeview.idShow
      JOIN seasons ON (seasons.idShow = tvshowview.idShow
                       AND seasons.season = episodeview.c12)
      JOIN files ON files.idFile = episodeview.idFile
      JOIN tvshowlinkpath ON tvshowlinkpath.idShow = tvshowview.idShow
      JOIN path ON path.idPath = tvshowlinkpath.idPath
  WHERE tvshowview.idShow = 1
  GROUP BY episodeview.c12;
