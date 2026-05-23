-- Autor: Daniel Enrique Catalan Mendia
-- Carnet: 2026234

USE tallermecanicodb_in4cm;

SET FOREIGN_KEY_CHECKS = 0; -- Desactiva temporalmente las llaves para poder limpiar
TRUNCATE TABLE ORDEN_REPUESTO;
TRUNCATE TABLE ORDEN_MECANICO;
TRUNCATE TABLE ORDEN_SERVICIO;
TRUNCATE TABLE VEHICULOS;
TRUNCATE TABLE REPUESTOS;
TRUNCATE TABLE MECANICOS;
TRUNCATE TABLE CLIENTES;
SET FOREIGN_KEY_CHECKS = 1; -- Reactiva las llaves de seguridad

INSERT INTO CLIENTES (cedula, nombre, direccion) VALUES 
('1001', 'Juan Perez', 'Zona 1, Ciudad'), ('1002', 'Maria Lopez', 'Zona 2, Ciudad'),
('1003', 'Carlos Ruiz', 'Zona 3, Ciudad'), ('1004', 'Ana Gomez', 'Zona 4, Ciudad'),
('1005', 'Luis Fernandez', 'Zona 5, Ciudad'), ('1006', 'Marta Silva', 'Zona 6, Ciudad'),
('1007', 'Jorge Ramos', 'Zona 7, Ciudad'), ('1008', 'Elena Cruz', 'Zona 8, Ciudad'),
('1009', 'Pedro Paz', 'Zona 9, Ciudad'), ('1010', 'Lucia Ortiz', 'Zona 10, Ciudad'),
('1011', 'Mario Vega', 'Zona 11, Ciudad'), ('1012', 'Rosa Luna', 'Zona 12, Ciudad'),
('1013', 'Diego Castro', 'Zona 13, Ciudad'), ('1014', 'Sara Rios', 'Zona 14, Ciudad'),
('1015', 'Pablo Gil', 'Zona 15, Ciudad');

CALL sp_insertar_cliente('1016', 'Sofia Mota', 'Zona 16, Ciudad');
CALL sp_insertar_cliente('1017', 'Raul Cano', 'Zona 17, Ciudad');
CALL sp_insertar_cliente('1018', 'Laura Ruz', 'Zona 18, Ciudad');
CALL sp_insertar_cliente('1019', 'Oscar Rey', 'Zona 19, Ciudad');
CALL sp_insertar_cliente('1020', 'Diana Sol', 'Zona 21, Ciudad');

INSERT INTO MECANICOS (nombre, nivel_tecnico) VALUES 
('Alberto', 'Junior'), ('Beto', 'Senior'), ('Carlos', 'Master'), ('David', 'Junior'), ('Eduardo', 'Senior'),
('Fabian', 'Master'), ('Gabriel', 'Junior'), ('Hector', 'Senior'), ('Ivan', 'Master'), ('Javier', 'Junior'),
('Kevin', 'Senior'), ('Leonel', 'Master'), ('Manuel', 'Junior'), ('Nestor', 'Senior'), ('Omar', 'Master'),
('Patricio', 'Junior'), ('Quintin', 'Senior'), ('Roberto', 'Master'), ('Sergio', 'Junior'), ('Tomas', 'Senior');

INSERT INTO REPUESTOS (nombre, precio_unitario) VALUES 
('Filtro Aceite', 50.00), ('Bujía', 25.00), ('Pastillas Freno', 150.00), ('Correa Tiempo', 300.00), ('Batería', 600.00),
('Amortiguador', 450.00), ('Llanta', 500.00), ('Filtro Aire', 40.00), ('Radiador', 800.00), ('Bomba Agua', 350.00),
('Alternador', 900.00), ('Motor Arranque', 700.00), ('Disco Freno', 200.00), ('Aceite Motor', 180.00), ('Líquido Frenos', 35.00),
('Refrigerante', 45.00), ('Filtro Cabina', 60.00), ('Bobina', 250.00), ('Sensor Oxígeno', 320.00), ('Empaque Culata', 120.00);

-- D. Tabla VEHICULOS (15 por INSERT directo, 5 por SP seguro)
INSERT INTO VEHICULOS (placa, marca, modelo, color, id_cliente) VALUES 
('P001AAA', 'Toyota', 'Yaris', 'Rojo', 1), ('P002BBB', 'Honda', 'Civic', 'Azul', 2),
('P003CCC', 'Mazda', '3', 'Gris', 3), ('P004DDD', 'Nissan', 'Sentra', 'Blanco', 4),
('P005EEE', 'Kia', 'Rio', 'Negro', 5), ('P006FFF', 'Hyundai', 'Accent', 'Plata', 6),
('P007GGG', 'Ford', 'Fiesta', 'Rojo', 7), ('P008HHH', 'Chevrolet', 'Spark', 'Amarillo', 8),
('P009III', 'Volkswagen', 'Jetta', 'Azul', 9), ('P010JJJ', 'Suzuki', 'Swift', 'Verde', 10),
('P011KKK', 'Subaru', 'Impreza', 'Negro', 11), ('P012LLL', 'BMW', 'Serie 3', 'Blanco', 12),
('P013MMM', 'Audi', 'A4', 'Gris', 13), ('P014NNN', 'Mercedes', 'Clase C', 'Plata', 14),
('P015OOO', 'Peugeot', '208', 'Rojo', 15);

CALL sp_insertar_vehiculo('P016PPP', 'Renault', 'Clio', 'Azul', 16);
CALL sp_insertar_vehiculo('P017QQQ', 'Fiat', '500', 'Blanco', 17);
CALL sp_insertar_vehiculo('P018RRR', 'Jeep', 'Compass', 'Gris', 18);
CALL sp_insertar_vehiculo('P019SSS', 'Volvo', 'S60', 'Negro', 19);
CALL sp_insertar_vehiculo('P020TTT', 'Lexus', 'IS', 'Plata', 20);

INSERT INTO ORDEN_SERVICIO (fecha_ingreso, diagnostico, presupuesto, placa) VALUES 
('2026-05-01', 'Fallo en frenos', 500.00, 'P001AAA'), ('2026-05-02', 'Cambio de aceite', 200.00, 'P002BBB'),
('2026-05-03', 'Ruido en motor', 1500.00, 'P003CCC'), ('2026-05-04', 'Revisión general', 300.00, 'P004DDD'),
('2026-05-05', 'Falla eléctrica', 800.00, 'P005EEE'), ('2026-05-06', 'Pinchazo', 50.00, 'P006FFF'),
('2026-05-07', 'Cambio batería', 650.00, 'P007GGG'), ('2026-05-08', 'Alineación', 150.00, 'P008HHH'),
('2026-05-09', 'Luz check engine', 400.00, 'P009III'), ('2026-05-10', 'Calentamiento', 900.00, 'P010JJJ'),
('2026-05-11', 'Fuga de agua', 350.00, 'P011KKK'), ('2026-05-12', 'Cambio bujías', 250.00, 'P012LLL'),
('2026-05-13', 'Filtros tapados', 180.00, 'P013MMM'), ('2026-05-14', 'Suspensión dura', 1200.00, 'P014NNN'),
('2026-05-15', 'Cambio llantas', 2000.00, 'P015OOO'), ('2026-05-16', 'Freno largo', 300.00, 'P016PPP'),
('2026-05-17', 'No arranca', 850.00, 'P017QQQ'), ('2026-05-18', 'Ruido escape', 400.00, 'P018RRR'),
('2026-05-19', 'Vibración volante', 250.00, 'P019SSS'), ('2026-05-20', 'Servicio mayor', 1800.00, 'P020TTT');

INSERT INTO ORDEN_MECANICO (id_orden, id_mecanico, horas_trabajadas) VALUES 
(1, 1, 2), (2, 2, 1), (3, 3, 5), (4, 4, 2), (5, 5, 3), 
(6, 6, 1), (7, 7, 1), (8, 8, 2), (9, 9, 2), (10, 10, 4),
(11, 11, 2), (12, 12, 1), (13, 13, 1), (14, 14, 5), (15, 15, 2),
(16, 16, 2), (17, 17, 3), (18, 18, 2), (19, 19, 1), (20, 20, 6);

INSERT INTO ORDEN_REPUESTO (id_orden, id_repuesto, cantidad) VALUES 
(1, 3, 1), (2, 1, 1), (2, 14, 1), (3, 4, 1), (5, 11, 1), 
(7, 5, 1), (9, 19, 1), (10, 9, 1), (11, 10, 1), (12, 2, 4),
(13, 8, 1), (13, 17, 1), (14, 6, 2), (15, 7, 4), (16, 15, 1),
(17, 12, 1), (18, 18, 1), (20, 1, 1), (20, 14, 1), (20, 2, 4);

SELECT * FROM vista_resumen_ordenes;
SELECT * FROM vista_repuestos_utilizados;

CALL sp_listar_clientes();

CALL sp_buscar_cliente(5);

CALL sp_actualizar_cliente(1, 'Zona 1, Ciudad');

SELECT * FROM CLIENTES;
SELECT * FROM VEHICULOS;
SELECT * FROM MECANICOS;
SELECT * FROM REPUESTOS;
SELECT * FROM ORDEN_SERVICIO;
SELECT * FROM ORDEN_MECANICO;
SELECT * FROM ORDEN_REPUESTO;