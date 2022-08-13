-- creacion de la bd peluqueria


CREATE DATABASE peluqueria;
USE peluqueria;

create table dueno(
dni int unsigned not null primary key,
nombre varchar(30),
apellido varchar(30),
telefono varchar(12),
direccion varchar(50)

);

create table perro(
id_perro int unsigned  primary key,
nombre varchar(25),
fecha_nac date,
sexo enum('macho','hembra'),
dni_dueno int unsigned,

foreign key (dni_dueno) references dueno(dni)
);

create table historial(
id_historial int unsigned auto_increment primary key,
fecha date,
perro int unsigned,
descripcion varchar(50),
monto double,
foreign key (perro) references perro(id_perro)
);

INSERT INTO `peluqueria`.`dueno` (`dni`, `nombre`, `apellido`, `telefono`, `direccion`) VALUES ('27631704', 'julio', 'vidaurre', '3875198191', 'salta capital san martin 125');
INSERT INTO `peluqueria`.`dueno` (`dni`, `nombre`, `apellido`, `telefono`, `direccion`) VALUES ('33970636', 'valeria', 'santos', '3874838719', 'san rafael mz d1 l13');
INSERT INTO `peluqueria`.`dueno` (`dni`, `nombre`, `apellido`, `telefono`, `direccion`) VALUES ('53043774', 'valentina', 'vidaurre', '3875663322', 'san martin 125 b san luis');
INSERT INTO `peluqueria`.`dueno` (`dni`, `nombre`, `apellido`, `telefono`, `direccion`) VALUES ('25333444', 'pedro', 'baltazar', '3814556699', 'miguel lopez 325');
INSERT INTO `peluqueria`.`dueno` (`dni`, `nombre`, `apellido`, `telefono`, `direccion`) VALUES ('53044555', 'pedro luis', 'cruz', '3886998877', 'san juan 356');


INSERT INTO `peluqueria`.`perro` (`id_perro`,`nombre`, `fecha_nac`, `sexo`, `dni_dueno`) VALUES ('1','boxi', '2001-07-20', 'macho', '27631704');
INSERT INTO `peluqueria`.`perro` (`id_perro`,`nombre`, `fecha_nac`, `sexo`, `dni_dueno`) VALUES ('2','morena', '2018-10-30', 'hembra', '53043774');
INSERT INTO `peluqueria`.`perro` (`id_perro`,`nombre`, `fecha_nac`, `sexo`, `dni_dueno`) VALUES ('3','rubio', '2022-03-18', 'macho', '33970636');
INSERT INTO `peluqueria`.`perro` (`id_perro`,`nombre`, `fecha_nac`, `sexo`, `dni_dueno`) VALUES ('4','thor', '2020-05-05', 'macho', '25333444');
INSERT INTO `peluqueria`.`perro` (`id_perro`,`nombre`, `fecha_nac`, `sexo`, `dni_dueno`) VALUES ('5','umma', '2019-10-09', 'hembra', '53044555');

INSERT INTO `peluqueria`.`historial` (`fecha`, `perro`, `descripcion`, `monto`) VALUES ('2022-01-20', '1', 'corte de cabello', '2500');
INSERT INTO `peluqueria`.`historial` (`fecha`, `perro`, `descripcion`, `monto`) VALUES ('2022-02-01', '4', 'baño y corte', '4500.50');
INSERT INTO `peluqueria`.`historial` (`fecha`, `perro`, `descripcion`, `monto`) VALUES ('2022-02-14', '3', 'corte de uñas', '1850.50');
INSERT INTO `peluqueria`.`historial` (`fecha`, `perro`, `descripcion`, `monto`) VALUES ('2022-03-25', '2', 'baño', '3000');
INSERT INTO `peluqueria`.`historial` (`fecha`, `perro`, `descripcion`, `monto`) VALUES ('2022-04-18', '5', 'corte', '2000.35');
INSERT INTO `peluqueria`.`historial` (`fecha`, `perro`, `descripcion`, `monto`) VALUES ('2022-07-05', '1', 'baño', '3200');
INSERT INTO `peluqueria`.`historial` (`fecha`, `perro`, `descripcion`, `monto`) VALUES ('2022-07-12', '4', 'corte', '2600');
INSERT INTO `peluqueria`.`historial` (`fecha`, `perro`, `descripcion`, `monto`) VALUES ('2022-07-20', '2', 'corte de uñas', '2500');
INSERT INTO `peluqueria`.`historial` (`fecha`, `perro`, `descripcion`, `monto`) VALUES ('2022-08-10', '3', 'corte', '2800');

-- Ejercicio 5) Realice una consulta multitabla que arroje el nombre de todos los perros cuyos dueños se llaman Pedro

select perro.id_perro,perro.nombre,perro.sexo,dueno.apellido,dueno.nombre 
from perro
inner join dueno
where dueno.nombre like '%pedro%' and dueno.dni = perro.dni_dueno

-- Ejercicio 12) Obtener todos los perros de sexo “Macho” nacidos entre 2020 y 2022

SELECT * FROM perro
where perro.fecha_nac
between '2020-01-01' and '2022-12-31'

-- Ejercicio 7) Obtener los ingresos percibidos en Julio del 2022

SELECT sum(monto)
from historial
where fecha between '2022-07-01' and '2022-07-31'

