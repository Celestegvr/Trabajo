create database EmpresaComp;

use EmpresaComp;

create table Estado(
	IdEstado int primary key,
	Estado varchar(10),
);

create table Pais(
    IdPais int primary key,
    Nombre varchar(50) not null,
	Abreviatura varchar(2),
	CodigoPostal int,
	Nacionalidad varchar(30),
	IdEstado int,
	foreign key(IdEstado) references Estado(IdEstado),
);

create table Departamento(
    IdDepartamento int primary key,
    IdPais int,
    Nombre varchar(50) not null,
	Abreviatura varchar(2),
    foreign key(IdPais) references Pais(IdPais)
);

create table Municipio(
	IdMunicipio int primary key,
	IdDepartamento int,
	Nombre varchar(50) not null,
	Abreviatura varchar(2),
	foreign key(IdDepartamento) references Departamento(IdDepartamento),
);

create table Barrio(
	IdBarrio int primary key,
	Nombre varchar(50),
	Abreviatura varchar(2),
);

create table Ubicacion(
    IdUbicacion int primary key,
    IdPais int,
	IdDepartamento int,
	IdMunicipio int, 
	IdBarrio int,
	Calle varchar(50),
	Distrito varchar(50),
    foreign key(IdPais) references Pais(IdPais),
	foreign key(IdDepartamento) references Departamento(IdDepartamento),
	foreign key(IdMunicipio) references Municipio(IdMunicipio),
	foreign key(IdBarrio) references Barrio(IdBarrio),
);

create table ProveedorContactoT(
    IdProvTelefono int primary key,
    Nombre varchar(10),
    Sigla varchar(2),
	IdEstado int,
	foreign key(IdEstado) references Estado(IdEstado),
);

create table CatCompania(
    IdCatCompania int primary key,
	Nombre varchar(50),
	IdEstado int,
	foreign key(IdEstado) references Estado(IdEstado),
);

create table CompaniaTelefono(
	IdCompaTele int primary key,
	IdCompania int,
	IdProvTelefono int,
	foreign key(IdCompania) references CatCompania(IdCatCompania),
	foreign key(IdProvTelefono) references ProveedorContactoT(IdProvTelefono),
);

create table CatRedes(
	IdCRedes int primary key,
	NombreRedes varchar(30),
	Sigla varchar(15),
	Uso_Tipo varchar(30),
	IdEstado int,
	foreign key(IdEstado) references Estado(IdEstado),
);

create table RedesSociales(
	IdRedSoc int primary key,
	IdCompania int, 
	IdCRedes int,
	Nombre varchar(30),
	URL varchar(100),
	IdEstado int,
	foreign key(IdCompania) references CatCompania(IdCatCompania),
	foreign key(IdCRedes) references CatRedes(IdCRedes),
	foreign key(IdEstado) references Estado(IdEstado),
);

create table Compania(
	IdCompania int primary key,
	IdCatCompania int,
	IdUbicacion int,
	IdTelefono int,
	IdRedes int,
	foreign key(IdCatCompania) references CatCompania(IdCatCompania),
	foreign key(IdUbicacion) references Ubicacion(IdUbicacion),
	foreign key(IdTelefono) references CompaniaTelefono(IdCompaTele ),
	foreign key(IdRedes) references  RedesSociales(IdRedSoc),
);

create table CatSucursal(
    IdSucursal int primary key,
	Nombre varchar(50),
);

create table SucursalTelefono(
	IdSucursalTele int primary key,
	IdSucursal int,
	IdProvTelefono int,
	foreign key(IdSucursal) references CatSucursal(IdSucursal),
	foreign key(IdProvTelefono) references ProveedorContactoT(IdProvTelefono),
);

create table Sucursal(
    IdSucursal int primary key,
	IdCompania int,
    Nombre varchar(50) not null,
	IdMunicipio int not null,
	IdTelefono int,
	IdEstado int,
    foreign key(IdCompania) references CatCompania(IdCatCompania),
	foreign key(IdMunicipio) references Municipio(IdMunicipio),
	foreign key (IdTelefono) references SucursalTelefono(IdSucursalTele),
	foreign key(IdEstado) references Estado(IdEstado),
);
--------------------------------------------------------------------------------------------
create table tipo_identificacion(
	IdIdentificacion int primary key,
	TipoIdentificacion varchar(50),
);

Create table Modelo(
	IdModelo int primary key,
	Nombre varchar(50),
	Descripcion varchar(100),
);

create table Marcas(
	IdMarcas int primary key,
	Nombre varchar(50),
	Descripcion varchar(100),
	IdModelo int,
	foreign key (IdModelo) references Modelo(IdModelo),
);

create table Categoria(
	IdCategoria int primary key,
	Nombre varchar(50),
	Descripcion varchar(50),
	IdEstado int,
	foreign key(IdEstado) references Estado(IdEstado),
);

create table SubCategoria(
	IdSubcategoria int primary key,
	IdCategoria int,
	Nombre varchar(50),
	Descripcion varchar(50),
	IdEstado int,
	foreign key (IdCategoria) references Categoria(IdCategoria),
	foreign key(IdEstado) references Estado(IdEstado),
);

create table Tipo_Categorias(
	IdTipo_categoria int primary key,
	IdSubcategoria int,
	foreign key (IdSubcategoria) references Subcategoria(IdSubcategoria),
);

Create table Presentacion(
	IdPresentacion int primary key, 
	Nombre varchar(15), 
	Descripcion varchar(100),
);

create table UnidadM(
	IdUnidadM int primary key,
	Nombre varchar(50),
	Abreviatura varchar(10),
    Tipo varchar(50), --el tipo de magnitud 
	IdEstado int,
	foreign key(IdEstado) references Estado(IdEstado),
);

create table Productos(
	id_prod int primary key,
	Nombre varchar(50),
	Descripcion varchar(100),
	IdSubcategoria int,
	IdPresentacion int,
	UnidadM int,
	No_serie int,
	Cod_barra varchar(20),
	foreign key (IdSubcategoria) references Subcategoria(IdSubcategoria),
	foreign key (IdPresentacion) references Presentacion(IdPresentacion),
	foreign key (UnidadM) references UnidadM(IdUnidadM),
);

create table DetallesP(
	IdDetalleP int primary key,
	IdProd int,
	IdModelo int,
	Color varchar(50),
	foreign key (IdProd) references Productos(Id_Prod),
	foreign key (IdModelo) references Modelo(IdModelo),
);

create table Nacionalidad(
	IdNacionalidad int primary key,
	Tiponacionalidad varchar(50),
);

Create table AreaTrabajo(
	IdArea int primary key,
	NombreArea varchar(50),
);

create table Cargo(
	IdCargo int primary key,
	Nombre_Cargo varchar(30),
);

create table CatEmpleado(
    IdEmpleado int primary key,
	Nombre varchar(50),
);

create table TelefonoEmpleado(
  	IdTEmpleado int primary key,
	IdEmpleado int,
	IdProvTelefono int,
	foreign key(IdEmpleado) references CatEmpleado(IdEmpleado),
	foreign key(IdProvTelefono) references ProveedorContactoT(IdProvTelefono),
);

create table Empleados(
	IdEmpleados int primary key,
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	IdNacionalidad int,
	IdTelefonoEmpleado int,
	foreign key(IdNacionalidad) references Nacionalidad(IdNacionalidad),
	foreign key (IdTelefonoEmpleado) references TelefonoEmpleado(IdTEmpleado),
);

create table DetallesEmp(
	IdDEmpleados int primary key,
	IdEmpleado int, 
	Id_Cargo int,
	IdArea int,
	IdUbicacion int,
	HoraEntrada time,
	HoraSalida time,
	Correo_Electronico varchar(50),
	IdEstado int,
	foreign key (IdEmpleado) references Empleados(IdEmpleados),
	foreign key (Id_Cargo) references Cargo(IdCargo),
	foreign key (IdArea) references AreaTrabajo(IdArea),
	foreign key (IdUbicacion) references Ubicacion (IdUbicacion),
	foreign key (IdEstado) references Estado(IdEstado),
);

create table HistorialCargo(
	IdHCargo int primary key,
	IdEmpleado int, 
	IdCargo int,
	Fecha_Inicio date,
	Fecha_Fin date,
	IdAreaT int,
	foreign key(IdEmpleado) references Empleados(IdEmpleados),
	foreign key(IdCargo) references Cargo(IdCargo),
	foreign key(IdAreaT) references AreaTrabajo(IdArea),
);

Create table SalarioEmpleado(
	Id_Empleado int,
	SalarioBruto decimal(10,4),
	IR decimal(10,4),
	INNS decimal(10,4),
	SalarioNeto decimal(10,4)
	foreign key (Id_Empleado) references Empleados(IdEmpleados)
);

create table Tipo_proveedor(
	Idtipo_Proveedor int primary key,
	Tipo_proveedor varchar(50),
);

create table Proveedor(
	IdProveedor int primary key,
	Nombre varchar(50),
	Idtipo_proveedor int,
	NoRuc varchar(20),
	IdEstado int,
	foreign key (Idtipo_proveedor) references Tipo_proveedor(Idtipo_Proveedor),
	foreign key (IdEstado) references Estado(IdEstado),
);

create table ContactoProveedor(
	IdContacto int primary key,
	IdProveedor int,
	Telefono varchar(15),
	Correo varchar(50),
	foreign key (IdProveedor) references Proveedor(IdProveedor),
);

Create table ProdProve(
	IdProveedor int,
	Id_Producto int,
	foreign key (IdProveedor) references Proveedor(IdProveedor),
	foreign key (Id_Producto) references Productos(id_prod),
);

Create table Compra(
	IdCompra int primary key,
	IdProveedor int,
	FechaCompra date,
	NoVoucher varchar(50),
	foreign key (IdProveedor)references Proveedor(IdProveedor),
);

Create table DetaCompra(
	IddetCompra int,
	IdProducto int,
	CantidadComp int,
	PrecioU decimal(9,3),
	Monto decimal(9,3),
	foreign key (IddetCompra) references Compra(IdCompra)
);

create table Tipo_Cliente(
	Idtipo_Cliente int primary key,
	TipoCliente varchar(20) not null,
);

create table telefonoCliente(
	IdTC int primary key,
	Numero varchar(8),
    Tipo varchar(50), 
);

create table Cliente(
	IdCliente int primary key,
	Nombre_Cliente varchar(50) not null,
	Apellido_Cliente varchar(50) not null,
	IdTipo_Cliente int,
	IdTipoIdentificacion int,
	IdUbicacion int,
	IdNacionalidad int,
	IdTelefonoCliente int,
	Correo_Electronico varchar(50),
	foreign key(IdTipo_Cliente) references Tipo_Cliente(Idtipo_Cliente),
    foreign key(IdTipoIdentificacion) references tipo_identificacion(IdIdentificacion),
	foreign key(IdUbicacion) references Ubicacion(IdUbicacion),
	foreign key(IdNacionalidad) references Nacionalidad(IdNacionalidad),
	foreign key (IdTelefonoCliente) references TelefonoCliente(IdTC),
);
--Venta
Create table MetodoPago(
	IdMetodoP int primary key,
	Metodo_Pago varchar(20),
);	

Create table Ventas(
	IDVenta int primary key ,
	IdCliente int,
	IdEmpleado int,
	IdMetodo int,
	Descripcion varchar(200),
	Fecha_Venta date,
	foreign key (IdCliente) references Cliente(IdCliente),
	foreign key (IdEmpleado) references Empleados(IdEmpleados),
	foreign key (IdMetodo) references MetodoPago(IdMetodoP)
);

Create table Detalle_Venta(
	IDVenta int,
	Id_Producto int,
	Id_MetodoP int,
	Cantidad_Vendida int,
	PrecioUnitario Decimal(6,4),
	Monto decimal(6,4),
	foreign key (IDVenta) references Ventas(IDVenta),
	foreign key (Id_Producto) references Productos(Id_Prod),
);

Create table CalcVenta(
	IdVenta int,
	Subtotal Decimal(9,2),
	Descuento Decimal(9,2),
	IVA Decimal(9,2),
	Total Decimal(9,2),
	foreign key (IdVenta) references Ventas(IDVenta),
);

create table Inventario(
	IdInv int primary key,
	IdProducto int,
	IdProveedor int,
	Cantidadstock int,
	CantidadMinima int,
	Fecha_última_act date,
	Fecha_venc_ date,
	Ubicación_almacén varchar(50),
	foreign key (IdProducto) references Productos(Id_Prod),
	foreign key (IdProveedor)references Proveedor(IdProveedor),
);