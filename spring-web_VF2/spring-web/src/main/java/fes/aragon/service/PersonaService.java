package fes.aragon.service;

import fes.aragon.model.Persona;

import java.util.List;

public interface PersonaService {
    void agregarPersona(Persona persona);
    List<Persona> getLista();
    void setLista(List<Persona> lista);
}
