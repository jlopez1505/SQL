create database ropa character set utf8 collate utf8_unicode_ci;

use ropa;

create table usuarios (
idUsuario int auto_increment primary key not null,
nombre varchar(50), 
apellido varchar(50),
email varchar(50), 
contraseña varchar(50),
idRol int,
idEstado int
);

create table productos(
idProducto int auto_increment primary key not null, 
producto varchar(50),
cantidad int,
precio int,
descripcion text,
imgProducto varchar (255),
idCategoria int,
idSubcategoria int,
idEstado int
);

create table categorias(
idCategoria int auto_increment primary key not null, 
categoria varchar(50),
idEstado int 
);

create table subcategorias(
idSubcategoria int auto_increment primary key not null, 
subcategoria varchar(50),
idCategoria int,
idEstado int 
);

create table roles(
idRol int auto_increment primary key not null, 
rol varchar(50),
idEstado int 
);

create table estados(
idEstado int auto_increment primary key not null, 
estado varchar(50) 
);

insert into usuarios (nombre, apellido, email, contraseña, idRol, idEstado) values ('pepito', 'perez', 'correo@gmail.com', '123456', 1, 1);
insert into productos (producto, precio, cantidad, descripcion, imgProducto, idCategoria, idSubcategoria,  idEstado) values ('Chaqueta channel', 50000, 10, 'es muy bonita', 'images/pic1.jpg', 1, 1, 1);
insert into categorias (categoria, idEstado) values ('chaqueta', 1), ('camisas', 1), ('leggins', 1), ('botas', 1);
insert into subcategorias (subcategoria, idCategoria, idEstado) values ('Camufladas', 1, 1), ('drill', 1, 1), ('cuerina', 1, 1), ('estampados', 2, 1), ('sin estampados', 2, 1), ('algodon', 3, 1), ('altas',4 , 1), ('medianas',4 , 1), ('taches',4 , 1);
insert into roles (rol, idEstado) values ('admin', 1), ('superadmin', 1);
insert into estados (estado) values ('activo'), ('inactivo');

alter table usuarios add constraint fk_rol foreign key (idRol) references roles (idRol);
alter table usuarios add constraint fk_estadouser foreign key (idEstado) references estados (idEstado);


alter table productos add constraint fk_categoria foreign key (idCategoria) references categorias (idCategoria);
alter table productos add constraint fk_subcategoria foreign key (idSubcategoria) references subcategorias (idSubcategoria);
alter table productos add constraint fk_estadoprod foreign key (idEstado) references estados (idEstado);

alter table categorias add constraint fk_estadocat foreign key (idEstado) references estados (idEstado);

alter table subcategorias add constraint fk_estadosub foreign key (idEstado) references estados (idEstado);
alter table subcategorias add constraint fk_categoriasub foreign key (idCategoria) references categorias (idCategoria);

alter table roles add constraint fk_estadorol foreign key (idEstado) references estados (idEstado);
