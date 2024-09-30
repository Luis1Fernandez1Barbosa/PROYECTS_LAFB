SET NAMES 'UTF8MB4';
DROP DATABASE IF EXISTS informacion;
CREATE DATABASE IF NOT EXISTS informacion DEFAULT CHARACTER SET UTF8MB4;
USE informacion;

CREATE TABLE gerentes(
id_grt			INTEGER NOT NULL AUTO_INCREMENT,
nombre			VARCHAR(40) NOT NULL,
ap_paterno 		VARCHAR(20) NOT NULL,
ap_materno		VARCHAR(20) NOT NULL,
telefono			VARCHAR(10) NOT NULL,
PRIMARY KEY (id_grt)
)
DEFAULT CHARACTER SET UTF8MB4;

CREATE TABLE hoteles(
id_htl      	INTEGER NOT NULL AUTO_INCREMENT,
nombre			VARCHAR(40) NOT NULL,
direccion		VARCHAR(100) NOT NULL,
telefono    	VARCHAR(10) NOT NULL,
correo      	VARCHAR(50) NOT NULL,
id_grt			INTEGER,
PRIMARY KEY(id_htl),
FOREIGN KEY(id_grt) REFERENCES gerentes(id_grt) 
)
DEFAULT CHARACTER SET UTF8MB4;

CREATE TABLE habitaciones(
id_hbt			INTEGER NOT NULL AUTO_INCREMENT,
piso				VARCHAR(10) NOT NULL,
nombre			VARCHAR(30) NOT NULL,
refrigerador	BOOLEAN NOT NULL,
id_htl			INTEGER,
PRIMARY KEY (id_hbt),
FOREIGN KEY(id_htl) REFERENCES hoteles(id_htl) 
)
DEFAULT CHARACTER SET UTF8MB4;

DELETE FROM hoteles;
DELETE FROM gerentes;
DELETE FROM habitaciones;

INSERT INTO hoteles(nombre,direccion,telefono,correo) VALUES('H1','#32, Masfsdgd','5565986532','zacatlanMznH1@');
INSERT INTO hoteles(nombre,direccion,telefono,correo) VALUES('H2','#32, Benito Juarez','5598653748','zacatlanMznH2@');
INSERT INTO hoteles(nombre,direccion,telefono,correo) VALUES('H3','#32, calle 231','5689321445','zacatlanMznH3@');
INSERT INTO hoteles(nombre,direccion,telefono,correo) VALUES('H4','#32, av. Puebla','5556584785','zacatlanMznH4@');
INSERT INTO hoteles(nombre,direccion,telefono,correo) VALUES('H5','#32, Las Manzanas','5536985678','zacatlanMznH5@');


INSERT INTO gerentes(nombre,ap_paterno,ap_materno,telefono) VALUES('JOSE','MARTINEZ','GARCIA','5523324546');
INSERT INTO gerentes(nombre,ap_paterno,ap_materno,telefono) VALUES('PEDRO','GOMEZ','LARA','5586428357');
INSERT INTO gerentes(nombre,ap_paterno,ap_materno,telefono) VALUES('JUAN','GUERRERO','DEL RIO','5633220978');
INSERT INTO gerentes(nombre,ap_paterno,ap_materno,telefono) VALUES('GUADALUPE','RAMOS','PRADO','5539750011');
INSERT INTO gerentes(nombre,ap_paterno,ap_materno,telefono) VALUES('XOCHITL','NAH','XICOTENCATL','5623253410');

INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('1','1A01',0);
INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('1','1A02',0);
INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('2','2A01',0);
INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('2','2B01',1);
INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('3','3B01',1);
INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('3','3A01',0);
INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('3','3A02',0);
INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('4','4A01',0);
INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('4','4B01',1);
INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('4','4B02',1);
INSERT INTO habitaciones(piso,nombre,refrigerador) VALUES('5','5A01',0);


