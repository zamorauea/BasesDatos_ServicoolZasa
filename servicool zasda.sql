-- ============================================================
-- BASE DE DATOS: SERVICOOL ZASA
-- Sistema de Gestión de Clientes y Servicios
-- Ciudad: Esmeraldas, Ecuador
-- Autor: Viviana
-- ============================================================

CREATE DATABASE servicool_zasa;
USE servicool_zasa;

-- ============================================================
-- TABLA: CLIENTE
-- ============================================================
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150),
    telefono VARCHAR(15),
    correo VARCHAR(100)
);

-- ============================================================
-- TABLA: TÉCNICO
-- ============================================================
CREATE TABLE tecnico (
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(15)
);

-- ============================================================
-- TABLA: PRODUCTO
-- ============================================================
CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT DEFAULT 0
);

-- ============================================================
-- TABLA: SERVICIO
-- ============================================================
CREATE TABLE servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_tecnico INT,
    tipo_servicio VARCHAR(100),
    fecha_servicio DATE,
    estado VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_tecnico) REFERENCES tecnico(id_tecnico)
);

-- ============================================================
-- TABLA: DETALLE_SERVICIO
-- ============================================================
CREATE TABLE detalle_servicio (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT,
    id_producto INT,
    cantidad INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- ============================================================
-- TABLA: FACTURA
-- ============================================================
CREATE TABLE factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT,
    fecha_factura DATE,
    total DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
);

-- ============================================================
-- DATOS DE PRUEBA (Opcional)
-- ============================================================

INSERT INTO cliente (nombre, direccion, telefono, correo) VALUES
('Juan Pérez', 'Av. Libertad y Bolívar', '0987654321', 'juanperez@gmail.com'),
('María López', 'Calle Sucre 123', '0991122334', 'marialopez@hotmail.com');

INSERT INTO tecnico (nombre, especialidad, telefono) VALUES
('Carlos Ramos', 'Instalación', '0998877665'),
('Luis Torres', 'Mantenimiento', '0983344556');

INSERT INTO producto (nombre, tipo, precio, stock) VALUES
('Aire acondicionado 12kBTU', 'Split', 450.00, 10),
('Compresor 18kBTU', 'Repuesto', 250.00, 5);

INSERT INTO servicio (id_cliente, id_tecnico, tipo_servicio, fecha_servicio, estado) VALUES
(1, 1, 'Instalación', '2025-10-04', 'Finalizado'),
(2, 2, 'Mantenimiento', '2025-10-03', 'Pendiente');

INSERT INTO detalle_servicio (id_servicio, id_producto, cantidad, subtotal) VALUES
(1, 1, 1, 450.00),
(2, 2, 1, 250.00);

INSERT INTO factura (id_servicio, fecha_factura, total, metodo_pago) VALUES
(1, '2025-10-04', 450.00, 'Efectivo'),
(2, '2025-10-03', 250.00, 'Transferencia');
