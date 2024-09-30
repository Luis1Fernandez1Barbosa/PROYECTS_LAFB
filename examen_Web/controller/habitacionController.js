import { habitacion } from "../models/Habitacion.js";

const guardarHabitacion = async (req,res) => {
    const {id_hbt, piso, nombre, refrigerador, id_htl} = req.body;
    const errores = [];
    if (piso.trim()===""){
        errores.push({mensaje:"Favor de ingresar el piso de la habitación"})
    }
    if (nombre.trim()===""){
        errores.push({mensaje:"Favor de ingresar el nombre de la habitación"})
    }
    if(nombre.trim().length > 30){
        errores.push({mensaje:"El nombre de la habitación no puede exceder los 30 caracteres"})
    }
    if(piso.trim().length > 10){
        errores.push({mensaje:"El piso no puede exceder los 10 caracteres"})
    }
    if (errores.length > 0) {
        res.render("addHabitacion",{
            pagina:"Añadir habitacion",
            errores,
            piso,
            nombre,
            refrigerador,
            id_htl
        });
    } else {
        if(id_hbt > 0){ //Actualizar
            try{
                await habitacion.update({
                    piso,
                    nombre,
                    refrigerador,
                    id_htl
                }, {where:{id_hbt:id_hbt}});
                res.redirect(`/infoHotel?id_htl=${id_htl}`);
            } catch (error){
                console.log(error);
            }
        } else {
            //Almacenar en la bd
            try{
                await habitacion.create({
                    piso,
                    nombre,
                    refrigerador,
                    id_htl
                });
                res.redirect(`/infoHotel?id_htl=${id_htl}`);
            } catch (error) {
                console.log(error);
            }
        }
    }
};

const cambiarHabitacion = async (req,res) => {
    try {
        const hbt = await habitacion.findByPk(req.query.id_hbt);
        const errores = [];
        res.render("addHabitacion",{
            pagina:"Modificar Habitacion",
            errores,
            id_hbt:hbt.id_hbt,
            piso:hbt.piso,
            nombre:hbt.nombre,
            refrigerador:hbt.refrigerador,
            id_htl:hbt.id_htl
        });
    } catch (error) {
        console.log(error);
    }
};

export{
    guardarHabitacion,
    cambiarHabitacion
}