SET NAMES 'UTF8MB4';
DROP DATABASE IF EXISTS hoteles;
CREATE DATABASE IF NOT EXISTS hoteles DEFAULT CHARACTER SET UTF8MB4;
USE hoteles;

CREATE TABLE gerentes(
id_grt						INTEGER NOT NULL AUTO_INCREMENT,
nombre						VARCHAR(80) NOT NULL,
ap_paterno					VARCHAR(15) NOT NULL,
ap_materno					VARCHAR(15) NOT NULL,
telefono					VARCHAR(10) NOT NULL,
PRIMARY KEY(id_grt)
)DEFAULT CHARACTER SET UTF8MB4;

CREATE TABLE hoteles(
id_htl						INTEGER NOT NULL AUTO_INCREMENT,
nombre						VARCHAR(40) NOT NULL,
direccion					VARCHAR(100) NOT NULL,
telefono					VARCHAR(10) NOT NULL,
correo						VARCHAR(30) NOT NULL,
id_grt						INTEGER,
PRIMARY KEY(id_htl),
FOREIGN KEY(id_grt) REFERENCES gerentes(id_grt)
)DEFAULT CHARACTER SET UTF8MB4;

CREATE TABLE habitaciones(
id_hbt						INTEGER NOT NULL AUTO_INCREMENT,
piso							VARCHAR(10) NOT NULL,
nombre						VARCHAR(30) NOT NULL,
refrigerador				BOOLEAN	NOT NULL,
id_htl						INTEGER,
PRIMARY KEY(id_hbt),
FOREIGN KEY(id_htl) REFERENCES hoteles(id_htl)
)DEFAULT CHARACTER SET UTF8MB4;



DELETE FROM hoteles;
DELETE FROM habitaciones;
DELETE FROM gerentes;

alter table gerentes auto_increment=1;
alter table hoteles auto_increment=1;
alter table habitaciones auto_increment=1;

INSERT INTO gerentes(nombre,ap_paterno,ap_materno,telefono) VALUES('G1','AP1','Ap1','3433335566');
INSERT INTO gerentes(nombre,ap_paterno,ap_materno,telefono) VALUES('G2','AP2','Ap2','3433335566');
INSERT INTO gerentes(nombre,ap_paterno,ap_materno,telefono) VALUES('G3','AP3','Ap3','3433335566');

INSERT INTO hoteles(nombre,direccion,telefono,correo,id_grt) VALUES('H1','D1','1111111111','c1',1);
INSERT INTO hoteles(nombre,direccion,telefono,correo,id_grt) VALUES('H2','D2','2222222222','c2',2);
INSERT INTO hoteles(nombre,direccion,telefono,correo,id_grt) VALUES('H3','D3','3333333333','c3',3);

INSERT INTO habitaciones(piso,nombre,refrigerador,id_htl) VALUES('p1','p1',TRUE,1);
INSERT INTO habitaciones(piso,nombre,refrigerador,id_htl) VALUES('p2','p2',TRUE,1);
INSERT INTO habitaciones(piso,nombre,refrigerador,id_htl) VALUES('p3','p3',TRUE,2);
INSERT INTO habitaciones(piso,nombre,refrigerador,id_htl) VALUES('p4','p4',TRUE,2);
INSERT INTO habitaciones(piso,nombre,refrigerador,id_htl) VALUES('p5','p5',TRUE,3);
INSERT INTO habitaciones(piso,nombre,refrigerador,id_htl) VALUES('p6','p6',TRUE,3);