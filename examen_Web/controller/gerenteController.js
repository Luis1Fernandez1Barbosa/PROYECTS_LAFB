import { gerente } from "../models/Gerente.js";
const guardarGerente = async (req,res) => {
    const {id_grt, nombre, ap_paterno, ap_materno, telefono} = req.body;
    const errores = [];
    if (nombre.trim().length > 40){
        errores.push({mensaje:"El nombre ingresado es demasiado largo."})
    }
    if(ap_paterno.trim().length > 20) {
        errores.push({mensaje:"El apellido paterno ingresado es demasiado largo."})
    }
    if(ap_materno.trim().length > 20){
        errores.push({mensaje:"El apellido materno ingresado es demasiado largo."})
    }
    if(telefono.trim().length > 10){
        errores.push({mensaje:"El telefono ingresado es demasiado largo."})
    }
    if(nombre.trim()===""){
        errores.push({mensaje:"El nombre no puede ser vacío"})
    }
    if(ap_paterno.trim()===""){
        errores.push({mensaje:"El apellido paterno no puede ser vacío"})
    }
    if(ap_materno.trim()===""){
        errores.push({mensaje:"El apellido materno no puede ser vacío"})
    }
    if(telefono.trim()===""){
        errores.push({mensaje:"El telefono no puede ser vacío"})
    }
    if (errores.length > 0) {
        res.render("addGerente",{
            pagina:"Añadir gerente",
            errores,
            nombre,
            ap_paterno, 
            ap_materno, 
            telefono
        });
    } else {
        if(id_grt > 0){ //Actualizar
            try{
                await gerente.update({
                    nombre,
                    ap_paterno, 
                    ap_materno, 
                    telefono
                }, {where:{id_grt:id_grt}});
                res.redirect(`/listaHoteles`);                
            } catch (error){
                console.log(error);
            }
        } else {
            //Almacenar en la bd
            try{
                const ultimoGerente = await gerente.create({
                    nombre,
                    ap_paterno, 
                    ap_materno, 
                    telefono
                });
                res.redirect(`addHotelInter?idgrt=${ultimoGerente.dataValues.id_grt}&grtname=${ultimoGerente.dataValues.nombre}`);
            } catch (error) {
                console.log(error);
            }
        }
    }
};

const cambiarGerente = async (req,res) => {
    try {
        //Primero se elimina al gerente anterior, y luego se agrega el nuevo
        const ger = await gerente.findByPk(req.query.id_grt);
        
        const errores = [];
        res.render("addGerente",{
            pagina:"Cambiar gerente",
            errores,
            id_grt:ger.id_grt,
            nombre:ger.nombre,
            ap_paterno:ger.ap_paterno,
            ap_materno:ger.ap_materno,
            telefono:ger.telefono
        });
    } catch (error) {
        console.log(error);
    }
}

export {guardarGerente, cambiarGerente};