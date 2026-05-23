-- Autor: Daniel Enrique Catalan Mendia
-- Carnet: 2026234
DROP DATABASE IF EXISTS tallermecanicodb_in4cm;
CREATE DATABASE tallermecanicodb_in4cm;
USE tallermecanicodb_in4cm;

CREATE TABLE CLIENTES (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150)
);

CREATE TABLE VEHICULOS (
    placa VARCHAR(10) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    color VARCHAR(30),
    id_cliente INT,

    CONSTRAINT fk_vehiculo_cliente
        FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE ORDEN_SERVICIO (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    fecha_ingreso DATE NOT NULL,
    diagnostico TEXT,
    presupuesto DECIMAL(10,2),
    placa VARCHAR(10),
    CONSTRAINT fk_orden_vehiculo
        FOREIGN KEY (placa) REFERENCES VEHICULOS(placa)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE MECANICOS (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nivel_tecnico VARCHAR(50)
);

CREATE TABLE REPUESTOS (
    id_repuesto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE ORDEN_MECANICO (
    id_orden INT,
    id_mecanico INT,
    horas_trabajadas INT,
    PRIMARY KEY (id_orden, id_mecanico),
    -- ON DELETE CASCADE elimina los detalles automáticamente si se elimina la orden principal
    CONSTRAINT fk_orden_mecanico_orden
        FOREIGN KEY (id_orden) REFERENCES ORDEN_SERVICIO(id_orden)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orden_mecanico_mecanico
        FOREIGN KEY (id_mecanico) REFERENCES MECANICOS(id_mecanico)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE ORDEN_REPUESTO (
    id_orden INT,
    id_repuesto INT,
    cantidad INT,
    PRIMARY KEY (id_orden, id_repuesto),
    CONSTRAINT fk_orden_repuesto_orden
        FOREIGN KEY (id_orden) REFERENCES ORDEN_SERVICIO(id_orden)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orden_repuesto_repuesto
        FOREIGN KEY (id_repuesto) REFERENCES REPUESTOS(id_repuesto)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE VIEW vista_resumen_ordenes AS
SELECT 
    o.id_orden, o.fecha_ingreso, c.nombre AS cliente, v.placa, v.marca, o.presupuesto
FROM ORDEN_SERVICIO o
JOIN VEHICULOS v ON o.placa = v.placa
JOIN CLIENTES c ON v.id_cliente = c.id_cliente;

CREATE VIEW vista_repuestos_utilizados AS
SELECT 
    or_rep.id_orden, r.nombre AS repuesto, or_rep.cantidad, r.precio_unitario, 
    (or_rep.cantidad * r.precio_unitario) AS subtotal
FROM ORDEN_REPUESTO or_rep
JOIN REPUESTOS r ON or_rep.id_repuesto = r.id_repuesto;

DELIMITER //

-- [C]RUD: Procedimiento de Inserción (INSERT) para CLIENTES
CREATE PROCEDURE sp_insertar_cliente(
    IN p_cedula VARCHAR(20), IN p_nombre VARCHAR(100), IN p_direccion VARCHAR(150)
)
BEGIN
    INSERT INTO CLIENTES (cedula, nombre, direccion) VALUES (p_cedula, p_nombre, p_direccion);
END //

CREATE PROCEDURE sp_listar_clientes()
BEGIN
    SELECT * FROM CLIENTES;
END //

CREATE PROCEDURE sp_buscar_cliente(
    IN p_id_cliente INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE id_cliente = p_id_cliente) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El cliente buscado no existe.';
    ELSE
        SELECT * FROM CLIENTES WHERE id_cliente = p_id_cliente;
    END IF;
END //

CREATE PROCEDURE sp_actualizar_cliente(
    IN p_id_cliente INT, IN p_nueva_direccion VARCHAR(150)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE id_cliente = p_id_cliente) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El cliente que intenta actualizar no existe.';
    ELSE
        UPDATE CLIENTES SET direccion = p_nueva_direccion WHERE id_cliente = p_id_cliente;
    END IF;
END //

CREATE PROCEDURE sp_eliminar_cliente(
    IN p_id_cliente INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM VEHICULOS WHERE id_cliente = p_id_cliente) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: No se puede eliminar el cliente porque tiene vehículos asociados.';
    ELSEIF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE id_cliente = p_id_cliente) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El cliente no existe.';
    ELSE
        DELETE FROM CLIENTES WHERE id_cliente = p_id_cliente;
    END IF;
END //

CREATE PROCEDURE sp_insertar_vehiculo(
    IN p_placa VARCHAR(10), IN p_marca VARCHAR(50), IN p_modelo VARCHAR(50), 
    IN p_color VARCHAR(30), IN p_id_cliente INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE id_cliente = p_id_cliente) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El id_cliente proporcionado no existe en la base de datos.';
    ELSE
        INSERT INTO VEHICULOS (placa, marca, modelo, color, id_cliente) 
        VALUES (p_placa, p_marca, p_modelo, p_color, p_id_cliente);
    END IF;
END //

DELIMITER ;