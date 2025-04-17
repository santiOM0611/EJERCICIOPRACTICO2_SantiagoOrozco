package EJERCICIOPRACTICO.EJERCICIOPRACTICO.service;

import EJERCICIOPRACTICO.EJERCICIOPRACTICO.domain.Genero;
import java.util.List;

public interface GeneroService {

    // Se obtiene un listado de géneros en un List
    public List<Genero> getGeneros(boolean activos);

    // Se obtiene un Genero, a partir del id de un género
    public Genero getGenero(Genero genero);

    // Se inserta un nuevo género si el id del género está vacío
    // Se actualiza un género si el id del género NO está vacío
    public void save(Genero genero);

    // Se elimina el género que tiene el id pasado por parámetro
    public void delete(Genero genero);
}