package EJERCICIOPRACTICO.EJERCICIOPRACTICO.dao;

import EJERCICIOPRACTICO.EJERCICIOPRACTICO.domain.Funcion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FuncionDao extends JpaRepository<Funcion, Long> {
    
}
