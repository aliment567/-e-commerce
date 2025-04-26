1 Creamos la base de datos y le indicamos que vamos a trabajar con esa base datos.
CREATE DATABASE ecommerce;
USE ecommerce;

2 Creamos la tabla usuarios para poder registrar usuarios nuevos.  
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL);

3 Creamos la tabla productos para poder guardar la informacion de los productos que estan en venta. 
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL);

4 Creamos la tabla carrito_compras para guardar los productos que los usuarios pusieron en su carrito.
CREATE TABLE carrito_compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT DEFAULT 1,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id));

5 Creamos la tabla compras para saber cuando el usurio hace una compra.
CREATE TABLE compras (
    compra_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    total_compra DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id));


6 Creamos compra_productos para saber detalladamente que compro el usurio.
CREATE TABLE compra_productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_producto DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (compra_id) REFERENCES compras(compra_id),
    FOREIGN KEY (producto_id) REFERENCES productos(id));


7 Creamos la tabla pagos_compra para guardar cada pago que hace que se hace para una compra.
CREATE TABLE pagos_compra (
    pago_id INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL, 
    monto_pagado DECIMAL(10,2) NOT NULL,
    referencia_pago VARCHAR(100),
    FOREIGN KEY (compra_id) REFERENCES compras(compra_id));

8 Le agregabos datos a la tabla usurios. 
INSERT INTO usuarios (usuario, correo_electronico, contraseña)VALUES 
('camilog', 'camilo.gomez@correo.com', 'clave123'),
('laurap', 'laura.perez@correo.com', 'segura456'),
('andresm', 'andres.martinez@correo.com', 'miclave789');


9 Le agregamos datos a la tabla productos.
INSERT INTO productos (nombre, descripcion, precio, stock)VALUES
('Celular Samsung A34', 'Celular Samsung de gama media con buena cámara.', 1200000, 20),
('Audífonos JBL Tune', 'Audífonos inalámbricos con sonido profesional.', 350000, 30),
('Portátil HP Ryzen 5', 'Portátil HP ideal para estudiar y trabajar.', 2800000, 10);


10 insetamos datos en la tabla carrito_compras
INSERT INTO carrito_compras (usuario_id, producto_id, cantidad)VALUES
(1, 3, 1), 
(2, 2, 2),
(3, 1, 3); 


11 insetamos datos en la tabla compras
INSERT INTO compras (usuario_id, total_compra) VALUES
(1, 2800000),
(2, 70000),
(3, 3600000);

12 Insertamos datos en compra_productos 
INSERT INTO compra_productos (compra_id, producto_id, cantidad, precio_producto)VALUES
(1, 3, 1, 2800000), 
(2, 2, 2, 35000), 
(3, 1, 3, 1200000); 

13 Insertamos datos en la tabla pagos_compra
INSERT INTO pagos_compra (compra_id, metodo_pago, monto_pagado, referencia_pago)
VALUES
(1, 'tarjeta de crédito', 2800000 , 'PAGO-COL-123456'),
(2, 'efectivo', 70000 , 'PAGO-COL-189045'),
(3, 'Nequi', 3600000 , 'PAGO-COL-156980');






 
 


   

