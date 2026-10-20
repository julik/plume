select SUBSTRATE_HPRD_ID, count(substrate_refseq_id) as c
      from modificationsTmp where c > 1 group by SUBSTRATE_HPRD_ID;
