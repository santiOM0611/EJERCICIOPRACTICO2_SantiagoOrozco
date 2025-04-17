package EJERCICIOPRACTICO.EJERCICIOPRACTICO.controller;

import EJERCICIOPRACTICO.EJERCICIOPRACTICO.domain.Genero;
import EJERCICIOPRACTICO.EJERCICIOPRACTICO.service.GeneroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/genero")
public class GeneroController {

    @Autowired
    private GeneroService generoService;
    
    @GetMapping("/listado")
    public String inicio(Model model) {
        var generos = generoService.getGeneros(false);
        model.addAttribute("generos", generos);
        model.addAttribute("totalGeneros", generos.size());
        return "/genero/listado";
    }

    @GetMapping("/nuevo")
    public String generoNuevo(Genero genero) {
        return "/genero/modifica";
    }

    @PostMapping("/guardar")
    public String generoGuardar(Genero genero) {        
        generoService.save(genero);
        return "redirect:/genero/listado";
    }
    
    @GetMapping("/eliminar/{idGenero}")
    public String generoEliminar(Genero genero) {
        generoService.delete(genero);
        return "redirect:/genero/listado";
    }
    
    @GetMapping("/modificar/{idGenero}")
    public String generoModificar(Genero genero, Model model) {
        genero = generoService.getGenero(genero);
        model.addAttribute("genero", genero);
        return "/genero/modifica";
    }   
}
