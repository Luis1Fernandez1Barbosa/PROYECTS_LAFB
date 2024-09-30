import Sequelize  from "sequelize";
import db from "../config/db.js";
import { habitacion } from "./Habitacion.js";
import { gerente } from "./Gerente.js";

export const hotel = db.define('hoteles',{
    id_htl : {
        type:Sequelize.INTEGER,
        autoIncrement:true,
        primaryKey:true
    },
    nombre:{type:Sequelize.STRING(40)},
    direccion:{type:Sequelize.STRING(100)},
    telefono:{type:Sequelize.STRING(10)},
    correo:{type:Sequelize.STRING(50)},
    id_grt :{type:Sequelize.INTEGER,
    foreignKey:true,
    references:{
        model:"gerente",
        key:"id_grt"
    }
}
}, {timestamps:false});

hotel.hasMany (habitacion,{
    foreignKey:'id_htl'
});
  
habitacion.belongsTo(hotel, {
    foreignKey: {
      name: "id_htl",
    },
});

hotel.hasOne(gerente,{
    foreignKey: {
        name: "id_grt"
    }
});

gerente.belongsTo(hotel, {
    foreignKey: {
      name: "id_grt",
    },
});