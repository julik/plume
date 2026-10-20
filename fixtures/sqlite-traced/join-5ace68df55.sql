select usuarios.id, usuarios.nombre, centros.centro from
    usuarios left outer join centros on usuarios.idcentro = centros.id;
