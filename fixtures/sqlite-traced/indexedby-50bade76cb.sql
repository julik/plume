select * from maintable as m inner join
    joinme as j indexed by joinme_id_text_idx
    on ( m.id  = j.id_int)
