import {hotel} from "../models/Hotel.js";
import { gerente } from "../models/Gerente.js";
import { habitacion } from "../models/Habitacion.js";
const guardarHotel = async (req,res) => {
    const {id_htl, nombre, direccion, telefono, correo, id_grt} = req.body;
    const errores = [];
    if (nombre.trim()===""){
        errores.push({mensaje:"El nombre no debe ser vacío"})
    }
    if (direccion.trim()===""){
        errores.push({mensaje:"La dirección no debe ser vacía"})
    }
    if (telefono.trim()===""){
        errores.push({mensaje:"El teléfono no debe ser vacío"})
    }
    if (correo.trim()===""){
        errores.push({mensaje:"El correo no debe ser vacío"})
    }
    if(nombre.trim().length > 40){
        errores.push({mensaje:"El nombre del hotel no puede exceder los 40 caracteres"})
    }
    if(direccion.trim().length > 100){
        errores.push({mensaje:"La dirección del hotel no puede exceder los 100 caracteres"})
    }
    if(telefono.trim().length > 10){
        errores.push({mensaje:"El telefono del hotel no puede exceder los 10 caracteres"})
    }
    if(correo.trim().length > 50){
        errores.push({mensaje:"El correo del hotel no puede exceder los 50 caracteres"})
    }
    if (errores.length > 0) {
        res.render("addHotel",{
            pagina:"Añadir hoteles",
            errores,
            nombre,
            direccion,
            telefono,
            correo
        });
    } else {
        if(id_htl > 0){ //Actualizar
            try{
                await hotel.update({
                    nombre,
                    direccion,
                    telefono,
                    correo,
                    id_grt
                }, {where:{id_htl:id_htl}});
                res.redirect("/listaHoteles");
            } catch (error){
                console.log("error");
            }
        } else {
            //Almacenar en la bd
            try{
                await hotel.create({
                    nombre,
                    direccion,
                    telefono,
                    correo,
                    id_grt
                });
                res.redirect('/listaHoteles');
            } catch (error) {
                console.log(error);
            }
        }
    }
};

const listaHoteles = async (req, res) => {
    const hoteles = await hotel.findAll({
        attributes:["id_htl","nombre","direccion","telefono", "correo"],
        include: gerente
    });
    const gerentes = await gerente.findAll({
        attributes:["id_grt", "nombre", "ap_paterno", "ap_materno", "telefono"]
    })
    res.render("listaHoteles",{
        pagina: "Lista de hoteles",
        hoteles,
        gerentes
    });    
}

const cambiarHotel = async (req,res) => {
    console.log('Listo ' + req.query.id_htl);
    try {
        const hot = await hotel.findByPk(req.query.id_htl);
        const errores = [];
        res.render("addHotel",{
            pagina:"Modificar Hotel",
            errores,
            id_htl:hot.id_htl,
            idgrt:hot.id_grt,
            nombre:hot.nombre,
            direccion:hot.direccion,
            telefono:hot.telefono,
            correo:hot.correo
        });
    } catch (error) {
        console.log(error);
    }
}

const eliminarHotel = async(req,res) => {
    console.log('Eliminando ' + req.query.id_htl);
    try{
        await habitacion.destroy({
            where: {id_htl:req.query.id_htl}
        })
        await hotel.destroy({
            where: {id_htl:req.query.id_htl},
        });
        await gerente.destroy({
            where: {id_grt:req.query.id_grt}
        });
        
        res.redirect("/listaHoteles");
    } catch (error) {
        console.log(error);
    }
}

const infoHotel = async (req,res) => {
    const hotelInfo = await hotel.findByPk(req.query.id_htl,{
        include:[{
            model:gerente
        },{
            model:habitacion
        }]
    });
    res.render("infoHotel",{
        pagina: "Información del hotel "+ hotelInfo.nombre,
        hotelInfo,
    });   
}

export {guardarHotel, listaHoteles, eliminarHotel, cambiarHotel, infoHotel};