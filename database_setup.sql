-- Crear la base de datos
CREATE DATABASE SistemaFinancieroDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Usar la base de datos
USE SistemaFinancieroDB;

-- Crear la tabla Login
CREATE TABLE Login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    correo VARCHAR(255) NOT NULL UNIQUE,
    nombre VARCHAR(255),
    contrasena VARCHAR(255) NOT NULL,
    rol VARCHAR(50) NOT NULL DEFAULT 'Usuario',
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insertar datos de prueba en la tabla Login
INSERT INTO Login (correo, nombre, contrasena, rol) VALUES
('u202213404@upc.edu.pe', 'Jose Luza', 'password', 'Usuario'),
('correo@upc.edu.pe', 'Correo Prueba', 'Contra', 'Usuario'),
('admin@example.com', 'Administrador', 'password', 'Administrador'),
('test@example.com', 'Testeador', 'password', 'Usuario');

-- Crear la tabla Cartera
CREATE TABLE Cartera (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    saldo_total DECIMAL(10, 2) NOT NULL,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Login(id) ON DELETE CASCADE
);

-- Crear la tabla Factura
CREATE TABLE Factura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cartera_id INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    fecha_emision DATETIME NOT NULL,
    fecha_vencimiento DATETIME NOT NULL,
    FOREIGN KEY (cartera_id) REFERENCES Cartera(id) ON DELETE CASCADE
);

-- Crear la tabla Reporte
CREATE TABLE Reporte (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    descripcion TEXT,
    total DECIMAL(10, 2),
    fecha_generacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Login(id) ON DELETE CASCADE
);

-- Crear la tabla Facturas_Cartas
CREATE TABLE Facturas_Cartas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_emision DATETIME NOT NULL,
    fecha_vencimiento DATETIME,
    FOREIGN KEY (cliente_id) REFERENCES Login(id) ON DELETE CASCADE
);

-- Crear la tabla TCEA
CREATE TABLE TCEA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cartera VARCHAR(255) NOT NULL,
    tasa_descuento DECIMAL(5, 2) NOT NULL,
    tasa_aplicacion DECIMAL(5, 2) NOT NULL,
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP
);
