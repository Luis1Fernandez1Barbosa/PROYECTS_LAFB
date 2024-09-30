package fes.aragon.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Persona {
    @NotEmpty(message = "Nombre no debe ser vacío")
    //@Size(min = 3,max = 5,message = "Mínimo 3 y Máximo 5")
    private String nombre;
    @NotEmpty(message = "Apellido no debe ser vacío")
    private String apellido;
    @NotEmpty(message = "Correo no debe ser vacío")
   // @Email(message = "Correo no valido")
    private String correo;
}
