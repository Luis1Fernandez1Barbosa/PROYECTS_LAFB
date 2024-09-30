import express from 'express';
import { paginaInicio, paginaAddHotel, paginaAddGerente, paginaAddHabitacion, addHotelInter} from '../controller/paginaController.js';
import {listaHoteles, guardarHotel, eliminarHotel,cambiarHotel, infoHotel} from '../controller/hotelController.js';
import { cambiarGerente, guardarGerente } from '../controller/gerenteController.js';
import { cambiarHabitacion, guardarHabitacion } from '../controller/habitacionController.js';

const rutas = express.Router();
rutas.get("/", paginaInicio);
rutas.get("/addHotelInter",addHotelInter);

rutas.post("/addHotel", guardarHotel);

rutas.get("/listaHoteles", listaHoteles);
rutas.get("/addHotel", paginaAddHotel);
rutas.get("/eliminarHotel", eliminarHotel);
rutas.get("/modificarHotel", cambiarHotel)
rutas.get("/infoHotel", infoHotel)

rutas.post("/addGerente", guardarGerente);

rutas.get("/addGerente", paginaAddGerente);
rutas.get("/modificarGerente", cambiarGerente);

rutas.post("/addHabitacion", guardarHabitacion);

rutas.get("/addHabitacion", paginaAddHabitacion);
rutas.get("/modificarHabitacion", cambiarHabitacion)

export default rutas;