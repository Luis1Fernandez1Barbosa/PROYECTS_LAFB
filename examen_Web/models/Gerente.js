import Sequelize from "sequelize";
import db from "../config/db.js";

export const gerente = db.define(
  "gerentes",
  {
    id_grt: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    nombre: {
      type: Sequelize.STRING,
    },
    ap_paterno: {
      type: Sequelize.INTEGER,
    },
    ap_materno: {
      type: Sequelize.STRING,
    },
    telefono: {
      type: Sequelize.STRING,
    },
  },
  { timestamps: false }
);