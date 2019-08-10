CREATE DATABASE PERSONAS;
USE PERSONAS;
 
CREATE TABLE IF NOT EXISTS PERSONAS(
ID INT AUTO_INCREMENT NOT NULL,
CEDULA VARCHAR (13) NOT NULL,
NOMBRES VARCHAR (60) NOT NULL,
APELLIDOS varchar (60) NOT NULL,
DIRECCION varchar (200) NOT NULL,
CELULAR VARCHAR (10) NOT NULL,
PRIMARY KEY (ID),
UNIQUE (CEDULA)
 )ENGINE = InnoDB;
 
 CREATE TABLE IF NOT EXISTS TIPO_USUARIOS (
 ID INT AUTO_INCREMENT NOT NULL,
 COD_USUARIO VARCHAR (10) NOT NULL,
 NOMBRE_TIPO VARCHAR (30) NOT NULL,
 PRIMARY KEY (ID),
 UNIQUE (COD_USUARIO)
 )ENGINE = InnoDB;
 
 INSERT INTO TIPO_USUARIOS (COD_USUARIO,NOMBRE_TIPO) VALUES ('ADMIN','ADMINISTRADOR'), ('CLIEN','CLIENTE');
 
 CREATE TABLE IF NOT EXISTS USUARIOS(
 ID INT AUTO_INCREMENT NOT NULL,
 USUARIO VARCHAR (13) NOT NULL,
 PASSWORD VARCHAR (200) NOT NULL,
 COD_USUARIO VARCHAR (10) NOT NULL,
 PRIMARY KEY (ID),
 UNIQUE (USUARIO),
 CONSTRAINT USUARIOS_PERSONAS FOREIGN KEY (USUARIO) REFERENCES PERSONAS (CEDULA),
 CONSTRAINT USUARIOS_TIPOS FOREIGN KEY (COD_USUARIO) REFERENCES TIPO_USUARIOS (COD_USUARIO)
 )ENGINE = InnoDB;
 
 CREATE TABLE IF NOT EXISTS CLIENTES (
 ID INT AUTO_INCREMENT NOT NULL,
 COD_CLIENTE INT NOT NULL,
 CEDULA VARCHAR (13) NOT NULL,
 FRECUENTE INT NOT NULL,
 DIRECION_FACTURACION VARCHAR (200) NOT NULL,
 DIRECION_FACTURACION1 VARCHAR (200) NOT NULL,
 DIRECION_FACTURACION2 VARCHAR (200) NOT NULL,
 PRIMARY KEY (ID),
 UNIQUE (COD_CLIENTE),
 UNIQUE (CEDULA),
 CONSTRAINT CLIENTES_PERSONAS FOREIGN KEY (CEDULA) REFERENCES PERSONAS (CEDULA)
 )ENGINE = InnoDB;
 
 CREATE TABLE TIPO_PRODUCTO (
 ID INT AUTO_INCREMENT NOT NULL,
 COD_TIPO VARCHAR (10) NOT NULL,
 NOMBRE_TIPO VARCHAR (30) NOT NULL,
 PRIMARY KEY (ID),
 UNIQUE (COD_TIPO)
 )ENGINE = InnoDB;
 
  CREATE TABLE PRODUCTOS (
 ID INT AUTO_INCREMENT NOT NULL,
 COD_PRODUCTO INT NOT NULL,
 NOMBRE_PRODUCTO VARCHAR (50) NOT NULL,
 TIPO_PRODUCTO VARCHAR (10) NOT NULL,
 DESCRIPCION TEXT NOT NULL,
 PRECIO_VENTA FLOAT (15,2) NOT NULL, 
 PRIMARY KEY (ID),
 UNIQUE (COD_PRODUCTO)
 )ENGINE = InnoDB;
 
 CREATE TABLE IF NOT EXISTS STOCK_PRODUCTOS (
 ID INT AUTO_INCREMENT NOT NULL,
 COD_PRODUCTO INT NOT NULL,
 STOCK INT NOT NULL,
 FECHA DATE NOT NULL,
 PRIMARY KEY (ID),
 UNIQUE (COD_PRODUCTO),
 CONSTRAINT TIPO_PRODUCTO_STOCK FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTOS (COD_PRODUCTO)
 )ENGINE = InnoD;
 
 CREATE TABLE IF NOT EXISTS STOCK_ENTRADAS(
 ID INT AUTO_INCREMENT NOT NULL,
 COD_PRODUCTO INT NOT NULL,
 FECHA_ENTRADA DATE NOT NULL,
 CANTIDAD INT NOT NULL,
 PRIMARY KEY (ID),
 CONSTRAINT ENTRADA_STOCK FOREIGN KEY (COD_PRODUCTO) REFERENCES STOCK_PRODUCTOS (COD_PRODUCTO)
 )ENGINE = InnoDB;
 
  CREATE TABLE IF NOT EXISTS STOCK_SALIDAS(
 ID INT AUTO_INCREMENT NOT NULL,
 COD_PRODUCTO INT NOT NULL,
 FECHA_SALIDA DATE NOT NULL,
 CANTIDAD INT NOT NULL,
 PRIMARY KEY (ID),
 CONSTRAINT ENTRADA_STOCK FOREIGN KEY (COD_PRODUCTO) REFERENCES STOCK_PRODUCTOS (COD_PRODUCTO)
 )ENGINE = InnoDB;
 
 CREATE TABLE IF NOT EXISTS PEDIDOS (
 ID INT NOT NULL AUTO_INCREMENT,
 COD_PEDIDO INT NOT NULL,
 COD_CLIENTE INT NOT NULL,
 COD_PRODUCTO INT NOT NULL,
 CANTIDAD INT NOT NULL,
 ESTADO INT NOT NULL,
 PRIMARY KEY (ID),
 CONSTRAINT PEDIDOS_PRODUCTOS FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTOS (COD_PRODUCTO),
 CONSTRAINT PEDIDOS_CLIENTES FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTES (COD_CLIENTE)
 )ENGINE = InnoDB;
 
 CREATE TABLE IF NOT EXISTS FACTURAS(
 ID INT AUTO_INCREMENT NOT NULL,
 COD_FACTURA VARCHAR (20) NOT NULL,
 COD_PEDIDO INT NOT NULL,
 IMG_FACTURA VARCHAR (200),
 PRIMARY KEY (ID),
 CONSTRAINT FACTURA_PEDIDO FOREIGN KEY (COD_PEDIDO) REFERENCES PEDIDOS (COD_PEDIDO)
 )ENGINE = InnoDB; 