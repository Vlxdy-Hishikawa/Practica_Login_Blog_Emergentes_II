DROP DATABASE IF EXISTS  bd_blog;
CREATE DATABASE bd_blog CHARACTER SET utf8 COLLATE utf8_general_ci;
use bd_blog;
create table usuarios(
id int(11) not null auto_increment primary key,
usuario varchar(20),
password varchar(255)
);
create table post(
id int(11) not null auto_increment primary key,
fecha date,
titulo varchar(100),
contenido text
);

insert into usuarios (usuario,password) values ("Vlxdy","4321");
insert into usuarios (usuario,password) values ("admin","1234");

insert into post (fecha,titulo,contenido) values ("2021-05-11","Los mejores precios en celulares del 2021","Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");