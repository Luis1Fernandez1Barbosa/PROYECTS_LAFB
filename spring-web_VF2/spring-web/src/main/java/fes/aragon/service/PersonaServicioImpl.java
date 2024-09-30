package fes.aragon.service;

import fes.aragon.model.Persona;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Service
public class PersonaServicioImpl implements PersonaService{

    private List<Persona> lista=new ArrayList<>();
    @Override
    public void agregarPersona(Persona persona) {
           lista.add(persona);
    }

    @Override
    public List<Persona> getLista() {
        return this.lista;
    }

    @Override
    public void setLista(List<Persona> lista) {
        this.lista=lista;
    }
}
