package EJERCICIOPRACTICO.EJERCICIOPRACTICO.dao;

import EJERCICIOPRACTICO.EJERCICIOPRACTICO.domain.Genero;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GeneroDao extends JpaRepository<Genero, Long> {
    // Aquí puedes agregar métodos de consulta personalizados si los necesitas
}
