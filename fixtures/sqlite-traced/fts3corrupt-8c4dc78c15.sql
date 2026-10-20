UPDATE f_segments SET block = (
    SELECT block FROM f_segments WHERE blockid=1
  ) WHERE blockid=2
