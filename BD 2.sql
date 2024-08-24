CREATE DATABASE invernadero;

USE invernadero;

CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) UNIQUE NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL
);

CREATE TABLE Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE Tareas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    nombre_tarea VARCHAR(100) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    completada BOOLEAN DEFAULT 0,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

CREATE TABLE Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    fecha_venta DATETIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

CREATE TABLE Detalles_Venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (venta_id) REFERENCES Ventas(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);
-- Insertar usuarios
INSERT INTO Usuarios (nombre_usuario, correo, contraseña) VALUES ('usuario1', 'usuario1@example.com', 'contraseña1');
INSERT INTO Usuarios (nombre_usuario, correo, contraseña) VALUES ('usuario2', 'usuario2@example.com', 'contraseña2');

-- Insertar productos
INSERT INTO Productos (codigo, nombre, precio, costo, stock) VALUES ('001', 'Producto 1', 100.00, 80.00, 30);
INSERT INTO Productos (codigo, nombre, precio, costo, stock) VALUES ('002', 'Producto 2', 150.00, 120.00, 20);

-- Insertar tareas
INSERT INTO Tareas (usuario_id, nombre_tarea, fecha_hora, completada) VALUES (1, 'Tarea 1', '2024-08-22 10:00:00', 0);
INSERT INTO Tareas (usuario_id, nombre_tarea, fecha_hora, completada) VALUES (2, 'Tarea 2', '2024-08-23 11:00:00', 0);

-- Insertar ventas
INSERT INTO Ventas (usuario_id, fecha_venta, total) VALUES (1, '2024-08-22 12:00:00', 250.00);

-- Insertar detalles de venta
INSERT INTO Detalles_Venta (venta_id, producto_id, cantidad, precio) VALUES (1, 1, 2, 100.00);
INSERT INTO Detalles_Venta (venta_id, producto_id, cantidad, precio) VALUES (1, 2, 1, 150.00);
