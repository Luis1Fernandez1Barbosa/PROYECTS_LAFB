package fes.aragon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class InicioController {
    @GetMapping("/inicio")
    public String inicio(Model model){
        SimpleDateFormat formato=new SimpleDateFormat("dd/MM/yyyy");
        model.addAttribute("fecha",formato.format(new Date()));
        model.addAttribute("saludo","Hola Spring Web");
        return "inicio";
    }
    @GetMapping("/")
    public String salto(){
        return "salto";
    }
    @GetMapping("/principal")
    public String menu(){
        return "paginas/principal";
    }
    @PostMapping("entrada")
    public String datos(@RequestParam("nombre") String nombre,
                        @RequestParam("apellido") String apellido,
                        Model model){
        System.out.println("Dato: "+nombre + " "+apellido);
        model.addAttribute("datoNombre",nombre);
        return "inicio";
    }
}
