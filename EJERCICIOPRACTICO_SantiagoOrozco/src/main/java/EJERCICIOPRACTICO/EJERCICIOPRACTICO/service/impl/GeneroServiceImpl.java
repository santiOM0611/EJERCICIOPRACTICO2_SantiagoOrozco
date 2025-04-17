package EJERCICIOPRACTICO.EJERCICIOPRACTICO.service.impl;

import EJERCICIOPRACTICO.EJERCICIOPRACTICO.dao.GeneroDao;
import EJERCICIOPRACTICO.EJERCICIOPRACTICO.domain.Genero;
import EJERCICIOPRACTICO.EJERCICIOPRACTICO.service.GeneroService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GeneroServiceImpl implements GeneroService {

    @Autowired
    private GeneroDao generoDao;
    
    @Override
    @Transactional(readOnly=true)
    public List<Genero> getGeneros(boolean activos) {
        var lista = generoDao.findAll();
        if (activos) {
           lista.removeIf(e -> !e.isActivo());
        }
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Genero getGenero(Genero genero) {
        return generoDao.findById(genero.getIdGenero()).orElse(null);
    }
    
    @Override
    @Transactional
    public void save(Genero genero) {
        generoDao.save(genero);
    }
    
    @Override
    @Transactional
    public void delete(Genero genero) {
        generoDao.delete(genero);
    }
}
