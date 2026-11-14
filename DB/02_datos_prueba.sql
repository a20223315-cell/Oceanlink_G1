USE oceanlink;

INSERT INTO pais (codigo_pais, nombre) VALUES
  ('PE', 'Perú'),
  ('CL', 'Chile'),
  ('CO', 'Colombia'),
  ('PA', 'Panamá');
INSERT INTO rol (codigo_rol, nombre) VALUES
  ('ADMIN', 'Administrador'),
  ('CAPACITY', 'Planificador de capacidad'),
  ('NETWORK', 'Operador de red'),
  ('MAINTENANCE', 'Coordinador de mantenimiento'),
  ('SUPERVISOR', 'Supervisor');
INSERT INTO usuario (codigo_usuario, nombre_completo, correo, hash_contrasena, telefono, telefono_region, id_rol, id_pais, estado, fecha_ingreso, fecha_primera_activacion, ultimo_acceso) VALUES
  ('USR-0001', 'Rosales, Alonso', 'arosales@oceanlink.pe', '650006dc2054be32ac111ad91609fd4db2173208b05a0330c0f0f4008ca3a88e', '+51 987420118', 'PE', 1, 1, 1, '2024-03-12 00:00:00', '2024-03-12 00:00:00', '2026-09-13 13:42:00'),
  ('USR-0002', 'Ávalos, Kevin', 'kavalos@oceanlink.pe', '650006dc2054be32ac111ad91609fd4db2173208b05a0330c0f0f4008ca3a88e', '+51 945771203', 'PE', 4, 1, 1, '2025-01-08 00:00:00', '2025-01-08 00:00:00', '2026-09-13 12:18:00'),
  ('USR-0003', 'Aguilar, Matías', 'maguilar@oceanlink.pe', '650006dc2054be32ac111ad91609fd4db2173208b05a0330c0f0f4008ca3a88e', '+51 932608451', 'PE', 2, 1, 1, '2023-07-17 00:00:00', '2023-07-17 00:00:00', '2026-08-29 17:06:00'),
  ('USR-0004', 'Leon, Axel', 'aleon@oceanlink.pe', '650006dc2054be32ac111ad91609fd4db2173208b05a0330c0f0f4008ca3a88e', '+51 944212876', 'PE', 5, 1, 1, '2026-01-01 00:00:00', '2026-01-01 00:00:00', '2026-09-18 16:05:00'),
  ('USR-0005', 'Silvera, Ronal', 'rsilvera@oceanlink.pe', '650006dc2054be32ac111ad91609fd4db2173208b05a0330c0f0f4008ca3a88e', '+51 966308541', 'PE', 3, 1, 1, '2026-01-01 00:00:00', '2026-01-01 00:00:00', '2026-09-18 15:31:00');
INSERT INTO estacion (codigo_estacion, nombre, ubicacion, id_pais, capacidad_energia_kw, estado, condicion_operativa, fecha_registro) VALUES
  ('PE-0001', 'Lurín', 'Lima, Perú', 1, 500.0, 1, 'OPERATIVA', '2020-01-15 00:00:00'),
  ('CL-0002', 'Valparaíso', 'Valparaíso, Chile', 2, 520.0, 1, 'OPERATIVA', '2020-03-22 00:00:00'),
  ('CO-0003', 'Buenaventura', 'Valle del Cauca, Colombia', 3, 480.0, 1, 'OPERATIVA', '2021-06-18 00:00:00'),
  ('PE-0004', 'Máncora', 'Piura, Perú', 1, 450.0, 1, 'EN_MANTENIMIENTO', '2021-11-09 00:00:00'),
  ('CL-0005', 'Punta Arenas', 'Magallanes, Chile', 2, 510.0, 1, 'OPERATIVA', '2022-04-14 00:00:00'),
  ('PA-0006', 'Panamá', 'Ciudad de Panamá, Panamá', 4, 540.0, 1, 'OPERATIVA', '2022-08-30 00:00:00');
INSERT INTO segmento (codigo_segmento, id_estacion_origen, id_estacion_destino, capacidad_total_tbps, estado, condicion_operativa) VALUES
  ('SEG-0001', 1, 2, 20, 1, 'OPERATIVO'),
  ('SEG-0002', 1, 3, 40, 1, 'OPERATIVO'),
  ('SEG-0003', 2, 5, 15, 1, 'DEGRADADO'),
  ('SEG-0004', 3, 6, 8, 1, 'DEGRADADO'),
  ('SEG-0005', 4, 1, 6, 1, 'EN_MANTENIMIENTO'),
  ('SEG-0006', 5, 6, 4, 1, 'FUERA_SERVICIO');
INSERT INTO cliente (codigo_cliente, razon_social, tipo_identificacion, identificacion_fiscal, nombre_contacto, correo_contacto, telefono_contacto, estado) VALUES
  ('CLI-0001', 'Telco Global', 'RUC', '20547896321', 'Ana Vega', 'operaciones@telcoglobal.com', '+51 988112235', 1),
  ('CLI-0002', 'Red Andina', 'RUC', '20678123459', 'Diego Paredes', 'red@andina.pe', '+51 988112236', 1),
  ('CLI-0003', 'Pacífico Net', 'RUC', '20456987123', 'Silvera, Ronal', 'soporte@pacificonet.com', '+51 988112237', 1),
  ('CLI-0004', 'DataSur', 'RUC', '20600451238', 'Martín Flores', 'operaciones@datasur.pe', '+51 988112238', 1);
INSERT INTO solicitud_capacidad (codigo_solicitud, id_cliente, id_estacion_origen, id_estacion_destino, id_estado_solicitud, capacidad_solicitada_tbps, fecha_solicitud, creado_por, fecha_provision) VALUES
  ('REQ-0001', 1, 1, 2, 1, 0.5, '2026-09-12 09:00:00', 3, NULL),
  ('REQ-0002', 1, 1, 6, 2, 0.5, '2026-08-28 09:00:00', 3, NULL),
  ('REQ-0003', 2, 4, 2, 3, 0.3, '2026-09-05 09:00:00', 3, NULL),
  ('REQ-0004', 3, 1, 3, 4, 1.0, '2026-09-07 09:00:00', 3, '2026-09-09 09:00:00'),
  ('REQ-0005', 1, 1, 2, 5, 2.0, '2026-01-02 09:00:00', 3, '2026-01-14 00:00:00'),
  ('REQ-0006', 2, 4, 6, 7, 4.0, '2026-09-11 09:00:00', 3, NULL),
  ('REQ-0007', 3, 2, 6, 6, 1.0, '2026-09-10 09:00:00', 3, NULL),
  ('REQ-0008', 2, 4, 6, 3, 0.3, '2026-09-12 09:00:00', 3, NULL),
  ('REQ-0009', 1, 1, 3, 5, 0.5, '2026-05-27 09:00:00', 3, '2026-06-02 00:00:00'),
  ('REQ-0010', 1, 1, 3, 5, 1.0, '2026-02-23 09:00:00', 3, '2026-03-01 00:00:00'),
  ('REQ-0011', 1, 3, 6, 5, 1.0, '2026-07-02 09:00:00', 3, '2026-07-08 00:00:00'),
  ('REQ-0012', 2, 4, 1, 5, 1.0, '2026-02-10 09:00:00', 3, '2026-02-16 00:00:00'),
  ('REQ-0013', 3, 1, 2, 5, 0.2, '2026-01-21 09:00:00', 3, '2026-01-27 00:00:00'),
  ('REQ-0014', 4, 1, 2, 5, 13.8, '2026-01-08 09:00:00', 3, '2026-01-14 00:00:00'),
  ('REQ-0015', 4, 1, 3, 5, 8.5, '2026-01-08 09:00:00', 3, '2026-01-14 00:00:00'),
  ('REQ-0016', 3, 2, 5, 5, 14.5, '2026-01-08 09:00:00', 3, '2026-01-14 00:00:00'),
  ('REQ-0017', 2, 3, 6, 5, 5.7, '2026-01-08 09:00:00', 3, '2026-01-14 00:00:00'),
  ('REQ-0018', 4, 4, 1, 5, 3.1, '2026-01-08 09:00:00', 3, '2026-01-14 00:00:00'),
  ('REQ-0019', 1, 1, 2, 5, 0.4, '2026-02-01 09:00:00', 3, '2026-02-07 00:00:00');
INSERT INTO solicitud_segmento (id_solicitud, id_segmento, orden, fecha_reserva) VALUES
  (1, 1, 1, NULL),
  (2, 2, 1, NULL),
  (2, 4, 2, NULL),
  (3, 5, 1, NULL),
  (3, 1, 2, NULL),
  (4, 2, 1, '2026-09-09 09:00:00'),
  (5, 1, 1, '2026-01-14 00:00:00'),
  (6, 5, 1, NULL),
  (6, 2, 2, NULL),
  (6, 4, 3, NULL),
  (7, 3, 1, NULL),
  (7, 6, 2, NULL),
  (8, 5, 1, NULL),
  (8, 2, 2, NULL),
  (8, 4, 3, NULL),
  (9, 2, 1, '2026-06-02 00:00:00'),
  (10, 2, 1, '2026-03-01 00:00:00'),
  (11, 4, 1, '2026-07-08 00:00:00'),
  (12, 5, 1, '2026-02-16 00:00:00'),
  (13, 1, 1, '2026-01-27 00:00:00'),
  (14, 1, 1, '2026-01-14 00:00:00'),
  (15, 2, 1, '2026-01-14 00:00:00'),
  (16, 3, 1, '2026-01-14 00:00:00'),
  (17, 4, 1, '2026-01-14 00:00:00'),
  (18, 5, 1, '2026-01-14 00:00:00'),
  (19, 1, 1, '2026-02-07 00:00:00');

INSERT INTO servicio (codigo_servicio, id_solicitud, capacidad_contratada_tbps, estado, fecha_activacion, fecha_cancelacion) VALUES
  ('SRV-0001', 5, 2.0, 'ACTIVO', '2026-01-15 00:00:00', NULL),
  ('SRV-0002', 9, 0.5, 'ACTIVO', '2026-06-03 00:00:00', NULL),
  ('SRV-0003', 10, 1.0, 'ACTIVO', '2026-03-02 00:00:00', NULL),
  ('SRV-0004', 11, 1.0, 'ACTIVO', '2026-07-09 00:00:00', NULL),
  ('SRV-0005', 8, 0.3, 'PENDIENTE', NULL, NULL),
  ('SRV-0006', 12, 1.0, 'ACTIVO', '2026-02-17 00:00:00', NULL),
  ('SRV-0007', 13, 0.2, 'ACTIVO', '2026-01-28 00:00:00', NULL),
  ('SRV-0008', 14, 13.8, 'ACTIVO', '2026-01-15 00:00:00', NULL),
  ('SRV-0009', 15, 8.5, 'ACTIVO', '2026-01-15 00:00:00', NULL),
  ('SRV-0010', 16, 14.5, 'ACTIVO', '2026-01-15 00:00:00', NULL),
  ('SRV-0011', 17, 5.7, 'ACTIVO', '2026-01-15 00:00:00', NULL),
  ('SRV-0012', 18, 3.1, 'ACTIVO', '2026-01-15 00:00:00', NULL),
  ('SRV-0013', 19, 0.4, 'CANCELADO', '2026-02-08 00:00:00', '2026-08-15 00:00:00');
INSERT INTO servicio_segmento (id_servicio, id_segmento, orden) VALUES
  (1, 1, 1),
  (2, 2, 1),
  (3, 2, 1),
  (4, 4, 1),
  (5, 5, 1),
  (5, 2, 2),
  (5, 4, 3),
  (6, 5, 1),
  (7, 1, 1),
  (8, 1, 1),
  (9, 2, 1),
  (10, 3, 1),
  (11, 4, 1),
  (12, 5, 1),
  (13, 1, 1);
INSERT INTO incidencia (codigo_incidencia, severidad, fase, fecha_deteccion, descripcion, fecha_restauracion, fecha_cierre, resultado, creado_por) VALUES
  ('INC-0001', 'ALTA', 'EN_ANALISIS', '2026-09-11 08:20:00', 'Pérdida de señal detectada sobre el tramo Buenaventura - Panamá.', NULL, NULL, NULL, 5),
  ('INC-0002', 'MEDIA', 'REPARACION_PROGRAMADA', '2026-09-10 14:10:00', 'Intermitencia asociada a trabajos sobre la estación de Máncora.', NULL, NULL, NULL, 5),
  ('INC-0003', 'BAJA', 'RESTAURADA', '2026-09-08 06:30:00', 'Degradación temporal ya restaurada en el tramo Lurín - Valparaíso.', '2026-09-08 08:10:00', NULL, NULL, 5),
  ('INC-0004', 'CRITICA', 'EN_REPARACION', '2026-09-10 03:15:00', 'Pérdida severa de potencia óptica en el tramo Valparaíso - Punta Arenas.', NULL, NULL, NULL, 5),
  ('INC-0005', 'MEDIA', 'CERRADA', '2026-09-02 10:05:00', 'Atenuación temporal del enlace, restaurada y cerrada.', '2026-09-02 16:50:00', '2026-09-02 18:40:00', 'Servicio restaurado y monitoreo normalizado.', 5),
  ('INC-0006', 'ALTA', 'CERRADA', '2026-08-23 22:40:00', 'Falla de empalme con impacto sobre una ruta de servicio.', '2026-08-24 05:20:00', '2026-08-24 06:15:00', 'Empalme corregido y servicios verificados.', 5);
INSERT INTO incidencia_segmento (id_incidencia, id_segmento) VALUES
  (1, 4),
  (2, 5),
  (3, 1),
  (4, 3),
  (5, 1),
  (6, 4),
  (6, 2);
INSERT INTO observacion_incidencia (id_incidencia, fase, fecha, observacion, registrado_por) VALUES
  (1, 'DETECTADA', '2026-09-11 08:20:00', 'Se registra degradación de señal sobre SEG-0004.', 5),
  (1, 'EN_ANALISIS', '2026-09-11 08:42:00', 'Se identifican los servicios que utilizan el segmento afectado.', 5),
  (2, 'DETECTADA', '2026-09-10 14:10:00', 'Se detecta intermitencia sobre SEG-0005.', 5),
  (2, 'EN_ANALISIS', '2026-09-10 14:35:00', 'Se confirma relación con la estación PE-0004.', 5),
  (2, 'REPARACION_PROGRAMADA', '2026-09-10 16:00:00', 'Se programa intervención técnica.', 5),
  (3, 'DETECTADA', '2026-09-08 06:30:00', 'Se registra degradación temporal.', 5),
  (3, 'EN_ANALISIS', '2026-09-08 06:42:00', 'Se valida afectación parcial.', 5),
  (3, 'REPARACION_PROGRAMADA', '2026-09-08 07:00:00', 'Se coordina intervención.', 5),
  (3, 'EN_REPARACION', '2026-09-08 07:20:00', 'Equipo técnico interviene el tramo.', 5),
  (3, 'RESTAURADA', '2026-09-08 08:10:00', 'Servicio normalizado y validado.', 5),
  (4, 'DETECTADA', '2026-09-10 03:15:00', 'Alarma crítica reportada sobre SEG-0003.', 5),
  (4, 'EN_ANALISIS', '2026-09-10 03:28:00', 'Se confirma degradación severa de potencia.', 5),
  (4, 'REPARACION_PROGRAMADA', '2026-09-10 04:10:00', 'Se coordina intervención prioritaria.', 5),
  (4, 'EN_REPARACION', '2026-09-10 05:00:00', 'Cuadrilla trabajando sobre el tramo.', 5),
  (5, 'DETECTADA', '2026-09-02 10:05:00', 'Se detecta atenuación.', 5),
  (5, 'EN_ANALISIS', '2026-09-02 10:30:00', 'Se valida el tramo afectado.', 5),
  (5, 'REPARACION_PROGRAMADA', '2026-09-02 12:00:00', 'Intervención programada.', 5),
  (5, 'EN_REPARACION', '2026-09-02 14:20:00', 'Se corrige conector óptico.', 5),
  (5, 'RESTAURADA', '2026-09-02 16:50:00', 'Se restablece el servicio.', 5),
  (5, 'CERRADA', '2026-09-02 18:40:00', 'Servicio restaurado y monitoreo normalizado.', 5),
  (6, 'DETECTADA', '2026-08-23 22:40:00', 'Se registra pérdida de potencia.', 5),
  (6, 'EN_ANALISIS', '2026-08-23 23:00:00', 'Se localiza afectación en dos segmentos.', 5),
  (6, 'REPARACION_PROGRAMADA', '2026-08-24 00:15:00', 'Cuadrilla movilizada.', 5),
  (6, 'EN_REPARACION', '2026-08-24 02:10:00', 'Corrección del empalme.', 5),
  (6, 'RESTAURADA', '2026-08-24 05:20:00', 'Servicios verificados.', 5),
  (6, 'CERRADA', '2026-08-24 06:15:00', 'Empalme corregido y servicios verificados.', 5);
INSERT INTO mantenimiento (codigo_mantenimiento, id_tipo_mantenimiento, id_estacion, id_segmento, fase, inicio_programado, fin_programado, inicio_real, fecha_cierre, descripcion, resultado, creado_por) VALUES
  ('MNT-0001', 1, 4, NULL, 'PROGRAMADO', '2026-09-21 22:00:00', '2026-09-22 02:00:00', NULL, NULL, 'Revisión preventiva de energía y climatización de la estación.', NULL, 2),
  ('MNT-0002', 2, NULL, 4, 'EN_PROGRESO', '2026-09-16 09:00:00', '2026-09-16 15:00:00', '2026-09-16 09:00:00', NULL, 'Corrección de degradación detectada sobre el segmento.', NULL, 2),
  ('MNT-0003', 1, NULL, 1, 'FINALIZADO', '2026-09-05 08:00:00', '2026-09-05 11:00:00', '2026-09-05 08:00:00', '2026-09-05 11:00:00', 'Inspección preventiva del tramo.', 'Sin observaciones', 2),
  ('MNT-0004', 1, 2, NULL, 'FINALIZADO', '2026-08-30 07:00:00', '2026-08-30 09:00:00', '2026-08-30 07:00:00', '2026-08-30 09:00:00', 'Verificación de conectores y energía.', 'Conectores verificados', 2),
  ('MNT-0005', 2, NULL, 4, 'FINALIZADO', '2026-08-22 20:00:00', '2026-08-23 01:00:00', '2026-08-22 20:00:00', '2026-08-23 01:00:00', 'Corrección de degradación de señal.', 'Señal restablecida', 2);
INSERT INTO actividad_mantenimiento (id_mantenimiento, tipo_actividad, fecha, descripcion, registrado_por) VALUES
  (2, 'Inicio de mantenimiento', '2026-09-16 09:00:00', 'Se inicia la ventana correctiva y se confirma el impacto.', 2),
  (2, 'Actividad registrada', '2026-09-16 10:35:00', 'Se inspecciona el tramo y se valida potencia óptica.', 2),
  (3, 'Inicio de mantenimiento', '2026-09-05 08:00:00', 'Inicio de ventana preventiva.', 2),
  (3, 'Finalizado', '2026-09-05 11:00:00', 'Sin observaciones.', 2),
  (4, 'Inicio de mantenimiento', '2026-08-30 07:00:00', 'Inicio de revisión.', 2),
  (4, 'Finalizado', '2026-08-30 09:00:00', 'Conectores verificados.', 2),
  (5, 'Inicio de mantenimiento', '2026-08-22 20:00:00', 'Inicio correctivo.', 2),
  (5, 'Finalizado', '2026-08-23 01:00:00', 'Señal restablecida.', 2);

UPDATE usuario SET correo_personal=CONCAT(SUBSTRING_INDEX(correo,'@',1),'@example.com');
INSERT INTO usuario (codigo_usuario,nombre_completo,correo,correo_personal,hash_contrasena,telefono,telefono_region,id_rol,id_pais,estado,fecha_ingreso,fecha_primera_activacion,ultimo_acceso) VALUES
 ('USR-0006','Torres, Camila','ctorres@oceanlink.pe','camila.torres@example.com',SHA2('OceanLink2026*',256),'+56 912345678','CL',2,2,0,'2026-09-19',NULL,NULL),
 ('USR-0007','Rojas, Sebastián','srojas@oceanlink.pe','sebastian.rojas@example.com',SHA2('OceanLink2026*',256),'+57 3001234567','CO',3,3,1,'2025-04-10','2025-04-10','2026-09-19 15:00:00'),
 ('USR-0008','Mendoza, Valeria','vmendoza@oceanlink.pe','valeria.mendoza@example.com',SHA2('OceanLink2026*',256),'+507 61234567','PA',4,4,1,'2025-06-11','2025-06-11','2026-09-19 16:00:00'),
 ('USR-0009','Castillo, Lucía','lcastillo@oceanlink.pe','lucia.castillo@example.com',SHA2('OceanLink2026*',256),'+51 987654321','PE',5,1,0,'2025-02-12','2025-02-12','2026-08-30 10:00:00'),
 ('USR-0010','Vargas, Diego','dvargas@oceanlink.pe','diego.vargas@example.com',SHA2('OceanLink2026*',256),'+51 976543210','PE',3,1,0,'2026-09-20',NULL,NULL);
INSERT INTO cliente (codigo_cliente,razon_social,tipo_identificacion,identificacion_fiscal,nombre_contacto,correo_contacto,telefono_contacto,estado) VALUES
 ('CLI-0005','Conexión del Pacífico','RUC','20612345678','Mariana Soto','mariana.soto@example.com','+51 987654322',1),
 ('CLI-0006','Enlaces del Sur','RUC','20598765432','Javier Salas','javier.salas@example.com','+51 987654323',0);
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0020',5,1,3,5,0.8,'2026-09-14 09:00:00',3,'2026-09-17 10:00:00','Ampliación del enlace de datos entre Lurín y Buenaventura.'),
 ('REQ-0021',5,1,3,4,0.5,'2026-09-18 08:00:00',3,'2026-09-19 10:00:00','Capacidad reservada; pendiente de activación del servicio.'),
 ('REQ-0022',2,1,2,1,0.25,'2026-09-20 08:00:00',3,NULL,'Solicitud de respaldo para la sede de Valparaíso.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 (20,2,1,'2026-09-17 10:00:00'),(21,2,1,'2026-09-19 10:00:00'),(22,1,1,NULL);
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0014',20,0.8,'ACTIVO','2026-09-18 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES (14,2,1);
UPDATE solicitud_capacidad SET observacion=CASE id_estado_solicitud
 WHEN 1 THEN 'Solicitud registrada, pendiente de evaluación técnica.'
 WHEN 2 THEN 'Se revisa la ruta y la capacidad disponible.'
 WHEN 3 THEN 'Viabilidad aprobada, pendiente de reserva de capacidad.'
 WHEN 4 THEN 'Ruta provisionada, pendiente de activación.'
 WHEN 5 THEN 'Servicio activado y verificado con el cliente.'
 WHEN 6 THEN 'Solicitud rechazada por indisponibilidad de la ruta solicitada.'
 ELSE 'Se requiere ampliar la capacidad de los segmentos de la ruta.' END WHERE observacion IS NULL;
INSERT INTO incidencia (codigo_incidencia,severidad,fase,fecha_deteccion,descripcion,creado_por) VALUES
 ('INC-0007','BAJA','DETECTADA','2026-09-20 07:30:00','Alarma de potencia en el enlace Lurín - Buenaventura, pendiente de diagnóstico.',5);
INSERT INTO incidencia_segmento (id_incidencia,id_segmento) VALUES (7,2);
INSERT INTO observacion_incidencia (id_incidencia,fase,fecha,observacion,registrado_por) VALUES
 (7,'DETECTADA','2026-09-20 07:30:00','Se registra la alarma y se verifica el inventario de servicios del segmento SEG-0002.',5);
UPDATE mantenimiento SET inicio_programado='2026-09-20 09:00:00',fin_programado='2026-09-20 23:00:00',inicio_real='2026-09-20 09:00:00' WHERE id_mantenimiento=2;
UPDATE actividad_mantenimiento SET fecha=CASE WHEN tipo_actividad='Inicio de mantenimiento' THEN '2026-09-20 09:00:00' ELSE '2026-09-20 10:35:00' END WHERE id_mantenimiento=2;
INSERT INTO estacion (codigo_estacion,nombre,ubicacion,id_pais,capacidad_energia_kw,estado,condicion_operativa,fecha_registro) VALUES
 ('CL-0007','Arica','Arica y Parinacota, Chile','2','460','1','OPERATIVA','2026-08-15'),
 ('CO-0008','Cartagena','Bolívar, Colombia','3','580','1','OPERATIVA','2026-08-20'),
 ('PE-0009','Callao','Callao, Perú','1','620','1','OPERATIVA','2026-08-25'),
 ('PA-0010','Colón','Colón, Panamá','4','550','1','OPERATIVA','2026-08-28');
INSERT INTO segmento (codigo_segmento,id_estacion_origen,id_estacion_destino,capacidad_total_tbps,estado,condicion_operativa) VALUES
 ('SEG-0007','1','9','12','1','OPERATIVO'),
 ('SEG-0008','9','7','10','1','OPERATIVO'),
 ('SEG-0009','7','2','10','1','OPERATIVO'),
 ('SEG-0010','3','8','12','1','OPERATIVO'),
 ('SEG-0011','8','10','8','1','DEGRADADO'),
 ('SEG-0012','10','6','8','1','OPERATIVO'),
 ('SEG-0013','9','8','16','1','DEGRADADO'),
 ('SEG-0014','7','5','6','1','DEGRADADO');
INSERT INTO cliente (codigo_cliente,razon_social,tipo_identificacion,identificacion_fiscal,nombre_contacto,correo_contacto,telefono_contacto,estado) VALUES
 ('CLI-0007','Fibra Norte','RUC','20634567891','Paula Cabrera','paula.cabrera@example.com','+51 976543211','1'),
 ('CLI-0008','Altura Data','RUC','20576543219','Andrés Molina','andres.molina@example.com','+51 976543212','1');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0023','5','1','9','5','2','2026-09-01 09:00:00','3','2026-09-04 10:00:00','Enlace de acceso entre Lurín y la nueva estación del Callao.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('23','7','1','2026-09-04 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0015','23','2','ACTIVO','2026-09-05 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('15','7','1');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0024','7','9','2','5','1.5','2026-09-11 09:00:00','3','2026-09-14 10:00:00','Ruta comercial Callao - Arica - Valparaíso.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('24','8','1','2026-09-14 10:00:00'),
 ('24','9','2','2026-09-14 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0016','24','1.5','ACTIVO','2026-09-15 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('16','8','1'),
 ('16','9','2');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0025','8','3','6','5','2','2026-09-21 09:00:00','3','2026-09-24 10:00:00','Transporte de datos por Cartagena y Colón hasta Panamá.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('25','10','1','2026-09-24 10:00:00'),
 ('25','11','2','2026-09-24 10:00:00'),
 ('25','12','3','2026-09-24 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0017','25','2','ACTIVO','2026-09-25 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('17','10','1'),
 ('17','11','2'),
 ('17','12','3');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0026','5','9','8','5','4','2026-09-29 09:00:00','3','2026-10-02 10:00:00','Enlace directo Callao - Cartagena para distribución regional.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('26','13','1','2026-10-02 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0018','26','4','ACTIVO','2026-10-03 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('18','13','1');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0027','7','1','2','5','2','2026-10-08 09:00:00','3','2026-10-11 10:00:00','Ampliación comercial por la ruta costera del Pacífico.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('27','7','1','2026-10-11 10:00:00'),
 ('27','8','2','2026-10-11 10:00:00'),
 ('27','9','3','2026-10-11 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0019','27','2','ACTIVO','2026-10-12 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('19','7','1'),
 ('19','8','2'),
 ('19','9','3');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0028','8','3','6','5','1.5','2026-10-16 09:00:00','3','2026-10-19 10:00:00','Segundo circuito de transporte para Altura Data.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('28','10','1','2026-10-19 10:00:00'),
 ('28','11','2','2026-10-19 10:00:00'),
 ('28','12','3','2026-10-19 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0020','28','1.5','ACTIVO','2026-10-20 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('20','10','1'),
 ('20','11','2'),
 ('20','12','3');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0029','1','7','5','5','3','2026-10-24 09:00:00','3','2026-10-27 10:00:00','Circuito Arica - Punta Arenas para tráfico de datos.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('29','14','1','2026-10-27 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0021','29','3','ACTIVO','2026-10-28 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('21','14','1');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0030','4','1','6','5','1','2026-10-30 09:00:00','3','2026-11-02 10:00:00','Servicio multitramos Lurín - Callao - Cartagena - Colón - Panamá.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('30','7','1','2026-11-02 10:00:00'),
 ('30','13','2','2026-11-02 10:00:00'),
 ('30','11','3','2026-11-02 10:00:00'),
 ('30','12','4','2026-11-02 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0022','30','1','ACTIVO','2026-11-03 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('22','7','1'),
 ('22','13','2'),
 ('22','11','3'),
 ('22','12','4');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0031','7','9','2','5','1','2026-11-04 09:00:00','3','2026-11-07 10:00:00','Ampliación del transporte hacia Valparaíso.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('31','8','1','2026-11-07 10:00:00'),
 ('31','9','2','2026-11-07 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0023','31','1','ACTIVO','2026-11-08 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('23','8','1'),
 ('23','9','2');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0032','5','3','6','5','0.5','2026-11-06 09:00:00','3','2026-11-09 10:00:00','Capacidad adicional en la ruta norte.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('32','10','1','2026-11-09 10:00:00'),
 ('32','11','2','2026-11-09 10:00:00'),
 ('32','12','3','2026-11-09 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0024','32','0.5','ACTIVO','2026-11-10 10:00:00',NULL);
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('24','10','1'),
 ('24','11','2'),
 ('24','12','3');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0033','8','9','8','5','2','2026-10-06 09:00:00','3','2026-10-09 10:00:00','Circuito de campaña contratado por un periodo limitado.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('33','13','1','2026-10-09 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0025','33','2','CANCELADO','2026-10-10 10:00:00','2026-11-05 16:00:00');
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('25','13','1');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0034','7','1','9','5','1','2026-09-06 09:00:00','3','2026-09-09 10:00:00','Circuito de respaldo retirado tras finalizar la campaña.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('34','7','1','2026-09-09 10:00:00');
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado,fecha_activacion,fecha_cancelacion) VALUES
 ('SRV-0026','34','1','CANCELADO','2026-09-10 10:00:00','2026-10-15 16:00:00');
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('26','7','1');
INSERT INTO solicitud_capacidad (codigo_solicitud,id_cliente,id_estacion_origen,id_estacion_destino,id_estado_solicitud,capacidad_solicitada_tbps,fecha_solicitud,creado_por,fecha_provision,observacion) VALUES
 ('REQ-0035','7','9','2','4','1.5','2026-11-09 08:00:00','3','2026-11-11 10:00:00','Reserva de capacidad en Callao - Arica - Valparaíso; cliente pendiente de activación.'),
 ('REQ-0036','8','9','8','7','20','2026-11-10 09:00:00','3',NULL,'La capacidad solicitada supera los 16 Tbps del enlace; requiere ampliación.'),
 ('REQ-0037','5','7','5','6','1','2026-10-30 09:00:00','3',NULL,'Solicitud rechazada por la degradación del tramo y las condiciones del servicio.'),
 ('REQ-0038','7','3','6','2','0.4','2026-11-11 09:00:00','3',NULL,'Evaluación de la ruta norte y revisión del margen disponible.'),
 ('REQ-0039','8','9','2','3','0.5','2026-11-12 08:00:00','3',NULL,'Solicitud aprobada, pendiente de reserva y activación.');
INSERT INTO solicitud_segmento (id_solicitud,id_segmento,orden,fecha_reserva) VALUES
 ('35','8','1','2026-11-11 10:00:00'),
 ('35','9','2','2026-11-11 10:00:00'),
 ('36','13','1',NULL),
 ('37','14','1',NULL),
 ('38','10','1',NULL),
 ('38','11','2',NULL),
 ('38','12','3',NULL),
 ('39','8','1',NULL),
 ('39','9','2',NULL);
INSERT INTO servicio (codigo_servicio,id_solicitud,capacidad_contratada_tbps,estado) VALUES
 ('SRV-0027','39','0.5','PENDIENTE');
INSERT INTO servicio_segmento (id_servicio,id_segmento,orden) VALUES
 ('27','8','1'),
 ('27','9','2');
UPDATE solicitud_capacidad SET fecha_solicitud='2026-11-09 08:00:00',fecha_provision='2026-11-10 10:00:00' WHERE id_solicitud=21;
UPDATE solicitud_segmento SET fecha_reserva='2026-11-10 10:00:00' WHERE id_solicitud=21;
UPDATE solicitud_capacidad SET fecha_solicitud='2026-11-12 08:00:00' WHERE id_solicitud=22;
UPDATE incidencia SET fecha_deteccion=DATE_ADD(fecha_deteccion,INTERVAL 60 DAY),fecha_restauracion=DATE_ADD(fecha_restauracion,INTERVAL 60 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 60 DAY) WHERE id_incidencia=1;
UPDATE observacion_incidencia SET fecha=DATE_ADD(fecha,INTERVAL 60 DAY) WHERE id_incidencia=1;
UPDATE incidencia SET fecha_deteccion=DATE_ADD(fecha_deteccion,INTERVAL 58 DAY),fecha_restauracion=DATE_ADD(fecha_restauracion,INTERVAL 58 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 58 DAY) WHERE id_incidencia=2;
UPDATE observacion_incidencia SET fecha=DATE_ADD(fecha,INTERVAL 58 DAY) WHERE id_incidencia=2;
UPDATE incidencia SET fecha_deteccion=DATE_ADD(fecha_deteccion,INTERVAL 45 DAY),fecha_restauracion=DATE_ADD(fecha_restauracion,INTERVAL 45 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 45 DAY) WHERE id_incidencia=3;
UPDATE observacion_incidencia SET fecha=DATE_ADD(fecha,INTERVAL 45 DAY) WHERE id_incidencia=3;
UPDATE incidencia SET fecha_deteccion=DATE_ADD(fecha_deteccion,INTERVAL 62 DAY),fecha_restauracion=DATE_ADD(fecha_restauracion,INTERVAL 62 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 62 DAY) WHERE id_incidencia=4;
UPDATE observacion_incidencia SET fecha=DATE_ADD(fecha,INTERVAL 62 DAY) WHERE id_incidencia=4;
UPDATE incidencia SET fecha_deteccion=DATE_ADD(fecha_deteccion,INTERVAL 16 DAY),fecha_restauracion=DATE_ADD(fecha_restauracion,INTERVAL 16 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 16 DAY) WHERE id_incidencia=5;
UPDATE observacion_incidencia SET fecha=DATE_ADD(fecha,INTERVAL 16 DAY) WHERE id_incidencia=5;
UPDATE incidencia SET fecha_deteccion=DATE_ADD(fecha_deteccion,INTERVAL 44 DAY),fecha_restauracion=DATE_ADD(fecha_restauracion,INTERVAL 44 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 44 DAY) WHERE id_incidencia=6;
UPDATE observacion_incidencia SET fecha=DATE_ADD(fecha,INTERVAL 44 DAY) WHERE id_incidencia=6;
UPDATE incidencia SET fecha_deteccion=DATE_ADD(fecha_deteccion,INTERVAL 53 DAY),fecha_restauracion=DATE_ADD(fecha_restauracion,INTERVAL 53 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 53 DAY) WHERE id_incidencia=7;
UPDATE observacion_incidencia SET fecha=DATE_ADD(fecha,INTERVAL 53 DAY) WHERE id_incidencia=7;
INSERT INTO incidencia (codigo_incidencia,severidad,fase,fecha_deteccion,descripcion,fecha_restauracion,fecha_cierre,resultado,creado_por) VALUES
 ('INC-0008','CRITICA','CERRADA','2026-09-27 08:00:00','Pérdida de señal en la ruta Buenaventura - Cartagena - Colón.','2026-09-27 12:00:00','2026-09-27 13:00:00','Empalme reemplazado; potencia óptica y servicios de Altura Data verificados.','7');
INSERT INTO incidencia_segmento (id_incidencia,id_segmento) VALUES
 ('8','10'),
 ('8','11');
INSERT INTO observacion_incidencia (id_incidencia,fase,fecha,observacion,registrado_por) VALUES
 ('8','DETECTADA','2026-09-27 08:00:00','Se registra la alarma y se identifica la ruta afectada.','7'),
 ('8','EN_ANALISIS','2026-09-27 09:00:00','Se contrastan mediciones ópticas y servicios que utilizan el tramo.','5'),
 ('8','REPARACION_PROGRAMADA','2026-09-27 10:00:00','Se coordina la intervención y se informa la ventana a los clientes.','7'),
 ('8','EN_REPARACION','2026-09-27 11:00:00','La cuadrilla inspecciona conectores y corrige el punto de pérdida.','5'),
 ('8','RESTAURADA','2026-09-27 12:00:00','Se restablece la señal y se comprueba la continuidad de los servicios.','7'),
 ('8','CERRADA','2026-09-27 13:00:00','Se cierra el caso con el resultado técnico y las verificaciones realizadas. Empalme reemplazado; potencia óptica y servicios de Altura Data verificados.','5');
INSERT INTO incidencia (codigo_incidencia,severidad,fase,fecha_deteccion,descripcion,fecha_restauracion,fecha_cierre,resultado,creado_por) VALUES
 ('INC-0009','ALTA','RESTAURADA','2026-10-16 08:00:00','Intermitencia del transporte Callao - Arica - Valparaíso.','2026-10-16 12:00:00',NULL,'Conector reemplazado y servicio restablecido; pendiente de cierre administrativo.','7');
INSERT INTO incidencia_segmento (id_incidencia,id_segmento) VALUES
 ('9','8'),
 ('9','9');
INSERT INTO observacion_incidencia (id_incidencia,fase,fecha,observacion,registrado_por) VALUES
 ('9','DETECTADA','2026-10-16 08:00:00','Se registra la alarma y se identifica la ruta afectada.','7'),
 ('9','EN_ANALISIS','2026-10-16 09:00:00','Se contrastan mediciones ópticas y servicios que utilizan el tramo.','5'),
 ('9','REPARACION_PROGRAMADA','2026-10-16 10:00:00','Se coordina la intervención y se informa la ventana a los clientes.','7'),
 ('9','EN_REPARACION','2026-10-16 11:00:00','La cuadrilla inspecciona conectores y corrige el punto de pérdida.','5'),
 ('9','RESTAURADA','2026-10-16 12:00:00','Se restablece la señal y se comprueba la continuidad de los servicios. Conector reemplazado y servicio restablecido; pendiente de cierre administrativo.','7');
INSERT INTO incidencia (codigo_incidencia,severidad,fase,fecha_deteccion,descripcion,fecha_restauracion,fecha_cierre,resultado,creado_por) VALUES
 ('INC-0010','MEDIA','CERRADA','2026-10-27 08:00:00','Alarmas de potencia en el tramo Lurín - Callao.','2026-10-27 12:00:00','2026-10-27 13:00:00','Se limpian conectores y se valida estabilidad del enlace.','7');
INSERT INTO incidencia_segmento (id_incidencia,id_segmento) VALUES
 ('10','7');
INSERT INTO observacion_incidencia (id_incidencia,fase,fecha,observacion,registrado_por) VALUES
 ('10','DETECTADA','2026-10-27 08:00:00','Se registra la alarma y se identifica la ruta afectada.','7'),
 ('10','EN_ANALISIS','2026-10-27 09:00:00','Se contrastan mediciones ópticas y servicios que utilizan el tramo.','5'),
 ('10','REPARACION_PROGRAMADA','2026-10-27 10:00:00','Se coordina la intervención y se informa la ventana a los clientes.','7'),
 ('10','EN_REPARACION','2026-10-27 11:00:00','La cuadrilla inspecciona conectores y corrige el punto de pérdida.','5'),
 ('10','RESTAURADA','2026-10-27 12:00:00','Se restablece la señal y se comprueba la continuidad de los servicios.','7'),
 ('10','CERRADA','2026-10-27 13:00:00','Se cierra el caso con el resultado técnico y las verificaciones realizadas. Se limpian conectores y se valida estabilidad del enlace.','5');
INSERT INTO incidencia (codigo_incidencia,severidad,fase,fecha_deteccion,descripcion,fecha_restauracion,fecha_cierre,resultado,creado_por) VALUES
 ('INC-0011','ALTA','EN_ANALISIS','2026-11-11 08:00:00','Degradación óptica en el circuito Arica - Punta Arenas.',NULL,NULL,NULL,'7');
INSERT INTO incidencia_segmento (id_incidencia,id_segmento) VALUES
 ('11','14');
INSERT INTO observacion_incidencia (id_incidencia,fase,fecha,observacion,registrado_por) VALUES
 ('11','DETECTADA','2026-11-11 08:00:00','Se registra la alarma y se identifica la ruta afectada.','7'),
 ('11','EN_ANALISIS','2026-11-11 09:00:00','Se contrastan mediciones ópticas y servicios que utilizan el tramo.','5');
INSERT INTO incidencia (codigo_incidencia,severidad,fase,fecha_deteccion,descripcion,fecha_restauracion,fecha_cierre,resultado,creado_por) VALUES
 ('INC-0012','CRITICA','EN_REPARACION','2026-11-09 08:00:00','Pérdida parcial de señal en el enlace Cartagena - Colón.',NULL,NULL,NULL,'7');
INSERT INTO incidencia_segmento (id_incidencia,id_segmento) VALUES
 ('12','11');
INSERT INTO observacion_incidencia (id_incidencia,fase,fecha,observacion,registrado_por) VALUES
 ('12','DETECTADA','2026-11-09 08:00:00','Se registra la alarma y se identifica la ruta afectada.','7'),
 ('12','EN_ANALISIS','2026-11-09 09:00:00','Se contrastan mediciones ópticas y servicios que utilizan el tramo.','5'),
 ('12','REPARACION_PROGRAMADA','2026-11-09 10:00:00','Se coordina la intervención y se informa la ventana a los clientes.','7'),
 ('12','EN_REPARACION','2026-11-09 11:00:00','La cuadrilla inspecciona conectores y corrige el punto de pérdida.','5');
INSERT INTO incidencia (codigo_incidencia,severidad,fase,fecha_deteccion,descripcion,fecha_restauracion,fecha_cierre,resultado,creado_por) VALUES
 ('INC-0013','MEDIA','REPARACION_PROGRAMADA','2026-11-10 08:00:00','Variación de potencia en el circuito Callao - Cartagena.',NULL,NULL,NULL,'7');
INSERT INTO incidencia_segmento (id_incidencia,id_segmento) VALUES
 ('13','13');
INSERT INTO observacion_incidencia (id_incidencia,fase,fecha,observacion,registrado_por) VALUES
 ('13','DETECTADA','2026-11-10 08:00:00','Se registra la alarma y se identifica la ruta afectada.','7'),
 ('13','EN_ANALISIS','2026-11-10 09:00:00','Se contrastan mediciones ópticas y servicios que utilizan el tramo.','5'),
 ('13','REPARACION_PROGRAMADA','2026-11-10 10:00:00','Se coordina la intervención y se informa la ventana a los clientes.','7');
INSERT INTO incidencia (codigo_incidencia,severidad,fase,fecha_deteccion,descripcion,fecha_restauracion,fecha_cierre,resultado,creado_por) VALUES
 ('INC-0014','BAJA','DETECTADA','2026-11-12 08:00:00','Alarma preventiva en el enlace Callao - Arica.',NULL,NULL,NULL,'7');
INSERT INTO incidencia_segmento (id_incidencia,id_segmento) VALUES
 ('14','8');
INSERT INTO observacion_incidencia (id_incidencia,fase,fecha,observacion,registrado_por) VALUES
 ('14','DETECTADA','2026-11-12 08:00:00','Se registra la alarma y se identifica la ruta afectada.','7');
UPDATE mantenimiento SET inicio_programado=DATE_ADD(inicio_programado,INTERVAL 52 DAY),fin_programado=DATE_ADD(fin_programado,INTERVAL 52 DAY),inicio_real=DATE_ADD(inicio_real,INTERVAL 52 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 52 DAY) WHERE id_mantenimiento=1;
UPDATE actividad_mantenimiento SET fecha=DATE_ADD(fecha,INTERVAL 52 DAY) WHERE id_mantenimiento=1;
UPDATE mantenimiento SET inicio_programado=DATE_ADD(inicio_programado,INTERVAL 53 DAY),fin_programado=DATE_ADD(fin_programado,INTERVAL 53 DAY),inicio_real=DATE_ADD(inicio_real,INTERVAL 53 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 53 DAY) WHERE id_mantenimiento=2;
UPDATE actividad_mantenimiento SET fecha=DATE_ADD(fecha,INTERVAL 53 DAY) WHERE id_mantenimiento=2;
UPDATE mantenimiento SET inicio_programado=DATE_ADD(inicio_programado,INTERVAL 17 DAY),fin_programado=DATE_ADD(fin_programado,INTERVAL 17 DAY),inicio_real=DATE_ADD(inicio_real,INTERVAL 17 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 17 DAY) WHERE id_mantenimiento=3;
UPDATE actividad_mantenimiento SET fecha=DATE_ADD(fecha,INTERVAL 17 DAY) WHERE id_mantenimiento=3;
UPDATE mantenimiento SET inicio_programado=DATE_ADD(inicio_programado,INTERVAL 49 DAY),fin_programado=DATE_ADD(fin_programado,INTERVAL 49 DAY),inicio_real=DATE_ADD(inicio_real,INTERVAL 49 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 49 DAY) WHERE id_mantenimiento=4;
UPDATE actividad_mantenimiento SET fecha=DATE_ADD(fecha,INTERVAL 49 DAY) WHERE id_mantenimiento=4;
UPDATE mantenimiento SET inicio_programado=DATE_ADD(inicio_programado,INTERVAL 46 DAY),fin_programado=DATE_ADD(fin_programado,INTERVAL 46 DAY),inicio_real=DATE_ADD(inicio_real,INTERVAL 46 DAY),fecha_cierre=DATE_ADD(fecha_cierre,INTERVAL 46 DAY) WHERE id_mantenimiento=5;
UPDATE actividad_mantenimiento SET fecha=DATE_ADD(fecha,INTERVAL 46 DAY) WHERE id_mantenimiento=5;
UPDATE mantenimiento SET inicio_programado='2026-11-12 20:00:00',fin_programado='2026-11-12 23:00:00' WHERE id_mantenimiento=1;
INSERT INTO mantenimiento (codigo_mantenimiento,id_tipo_mantenimiento,id_estacion,id_segmento,fase,inicio_programado,fin_programado,inicio_real,fecha_cierre,descripcion,resultado,creado_por) VALUES
 ('MNT-0006','1',NULL,'10','FINALIZADO','2026-09-29 08:00:00','2026-09-29 11:00:00','2026-09-29 08:00:00','2026-09-29 11:00:00','Inspección preventiva del enlace Buenaventura - Cartagena.','Se validaron niveles de potencia y continuidad después de la incidencia INC-0008.','8');
INSERT INTO actividad_mantenimiento (id_mantenimiento,tipo_actividad,fecha,descripcion,registrado_por) VALUES
 ('6','Programación','2026-09-28 08:00:00','Se coordina la ventana, el equipo y los servicios que requieren seguimiento.','8'),
 ('6','Inicio de mantenimiento','2026-09-29 08:00:00','Se verifica el alcance y se inicia la intervención autorizada.','8'),
 ('6','Medición óptica','2026-09-29 09:00:00','Se registran niveles de potencia y se revisan conectores del tramo.','2'),
 ('6','Revisión de continuidad','2026-09-29 10:00:00','Se contrasta la continuidad con los servicios y clientes vinculados a la ruta.','8'),
 ('6','Finalizado','2026-09-29 11:00:00','Se validaron niveles de potencia y continuidad después de la incidencia INC-0008.','8');
INSERT INTO mantenimiento (codigo_mantenimiento,id_tipo_mantenimiento,id_estacion,id_segmento,fase,inicio_programado,fin_programado,inicio_real,fecha_cierre,descripcion,resultado,creado_por) VALUES
 ('MNT-0007','1','7',NULL,'FINALIZADO','2026-10-17 08:00:00','2026-10-17 11:00:00','2026-10-17 08:00:00','2026-10-17 11:00:00','Revisión de energía y conectores en la estación Arica.','Energía, climatización y conectores verificados después de INC-0009.','8');
INSERT INTO actividad_mantenimiento (id_mantenimiento,tipo_actividad,fecha,descripcion,registrado_por) VALUES
 ('7','Programación','2026-10-16 08:00:00','Se coordina la ventana, el equipo y los servicios que requieren seguimiento.','8'),
 ('7','Inicio de mantenimiento','2026-10-17 08:00:00','Se verifica el alcance y se inicia la intervención autorizada.','8'),
 ('7','Medición óptica','2026-10-17 09:00:00','Se registran niveles de potencia y se revisan conectores del tramo.','2'),
 ('7','Revisión de continuidad','2026-10-17 10:00:00','Se contrasta la continuidad con los servicios y clientes vinculados a la ruta.','8'),
 ('7','Finalizado','2026-10-17 11:00:00','Energía, climatización y conectores verificados después de INC-0009.','8');
INSERT INTO mantenimiento (codigo_mantenimiento,id_tipo_mantenimiento,id_estacion,id_segmento,fase,inicio_programado,fin_programado,inicio_real,fecha_cierre,descripcion,resultado,creado_por) VALUES
 ('MNT-0008','2',NULL,'7','FINALIZADO','2026-10-28 08:00:00','2026-10-28 11:00:00','2026-10-28 08:00:00','2026-10-28 11:00:00','Verificación correctiva de conectores en Lurín - Callao.','Potencia estable y pruebas de continuidad satisfactorias para INC-0010.','8');
INSERT INTO actividad_mantenimiento (id_mantenimiento,tipo_actividad,fecha,descripcion,registrado_por) VALUES
 ('8','Programación','2026-10-27 08:00:00','Se coordina la ventana, el equipo y los servicios que requieren seguimiento.','8'),
 ('8','Inicio de mantenimiento','2026-10-28 08:00:00','Se verifica el alcance y se inicia la intervención autorizada.','8'),
 ('8','Medición óptica','2026-10-28 09:00:00','Se registran niveles de potencia y se revisan conectores del tramo.','2'),
 ('8','Revisión de continuidad','2026-10-28 10:00:00','Se contrasta la continuidad con los servicios y clientes vinculados a la ruta.','8'),
 ('8','Finalizado','2026-10-28 11:00:00','Potencia estable y pruebas de continuidad satisfactorias para INC-0010.','8');
INSERT INTO mantenimiento (codigo_mantenimiento,id_tipo_mantenimiento,id_estacion,id_segmento,fase,inicio_programado,fin_programado,inicio_real,fecha_cierre,descripcion,resultado,creado_por) VALUES
 ('MNT-0009','1','8',NULL,'PROGRAMADO','2026-11-12 21:00:00','2026-11-12 22:00:00',NULL,NULL,'Ventana de revisión de energía y climatización en Cartagena.',NULL,'8');
INSERT INTO actividad_mantenimiento (id_mantenimiento,tipo_actividad,fecha,descripcion,registrado_por) VALUES
 ('9','Programación','2026-11-11 21:00:00','Se coordina la ventana, el equipo y los servicios que requieren seguimiento.','8');
INSERT INTO mantenimiento (codigo_mantenimiento,id_tipo_mantenimiento,id_estacion,id_segmento,fase,inicio_programado,fin_programado,inicio_real,fecha_cierre,descripcion,resultado,creado_por) VALUES
 ('MNT-0010','2',NULL,'11','EN_PROGRESO','2026-11-12 08:00:00','2026-11-12 23:00:00','2026-11-12 08:00:00',NULL,'Corrección óptica en Cartagena - Colón por INC-0012.',NULL,'8');
INSERT INTO actividad_mantenimiento (id_mantenimiento,tipo_actividad,fecha,descripcion,registrado_por) VALUES
 ('10','Programación','2026-11-11 08:00:00','Se coordina la ventana, el equipo y los servicios que requieren seguimiento.','8'),
 ('10','Inicio de mantenimiento','2026-11-12 08:00:00','Se verifica el alcance y se inicia la intervención autorizada.','8'),
 ('10','Medición óptica','2026-11-12 09:00:00','Se registran niveles de potencia y se revisan conectores del tramo.','2'),
 ('10','Revisión de continuidad','2026-11-12 10:00:00','Se contrasta la continuidad con los servicios y clientes vinculados a la ruta.','8');
INSERT INTO mantenimiento (codigo_mantenimiento,id_tipo_mantenimiento,id_estacion,id_segmento,fase,inicio_programado,fin_programado,inicio_real,fecha_cierre,descripcion,resultado,creado_por) VALUES
 ('MNT-0011','1',NULL,'13','FINALIZADO','2026-11-06 08:00:00','2026-11-06 11:00:00','2026-11-06 08:00:00','2026-11-06 11:00:00','Revisión de potencia del enlace Callao - Cartagena.','Pruebas preventivas sin interrupción; niveles registrados para seguimiento.','8');
INSERT INTO actividad_mantenimiento (id_mantenimiento,tipo_actividad,fecha,descripcion,registrado_por) VALUES
 ('11','Programación','2026-11-05 08:00:00','Se coordina la ventana, el equipo y los servicios que requieren seguimiento.','8'),
 ('11','Inicio de mantenimiento','2026-11-06 08:00:00','Se verifica el alcance y se inicia la intervención autorizada.','8'),
 ('11','Medición óptica','2026-11-06 09:00:00','Se registran niveles de potencia y se revisan conectores del tramo.','2'),
 ('11','Revisión de continuidad','2026-11-06 10:00:00','Se contrasta la continuidad con los servicios y clientes vinculados a la ruta.','8'),
 ('11','Finalizado','2026-11-06 11:00:00','Pruebas preventivas sin interrupción; niveles registrados para seguimiento.','8');
INSERT INTO mantenimiento (codigo_mantenimiento,id_tipo_mantenimiento,id_estacion,id_segmento,fase,inicio_programado,fin_programado,inicio_real,fecha_cierre,descripcion,resultado,creado_por) VALUES
 ('MNT-0012','2',NULL,'14','PROGRAMADO','2026-11-12 22:00:00','2026-11-12 23:00:00',NULL,NULL,'Intervención del circuito Arica - Punta Arenas por INC-0011.',NULL,'8');
INSERT INTO actividad_mantenimiento (id_mantenimiento,tipo_actividad,fecha,descripcion,registrado_por) VALUES
 ('12','Programación','2026-11-11 22:00:00','Se coordina la ventana, el equipo y los servicios que requieren seguimiento.','8');
INSERT INTO actividad_mantenimiento (id_mantenimiento,tipo_actividad,fecha,descripcion,registrado_por) VALUES
 ('1','Programación','2026-11-11 14:00:00','Se confirma la ventana de energía de Máncora y se revisan los servicios del segmento SEG-0005.','2'),
 ('2','Medición óptica','2026-11-12 11:00:00','Se contrasta la potencia del tramo Buenaventura - Panamá con los valores de referencia.','2'),
 ('2','Seguimiento','2026-11-12 12:00:00','La cuadrilla continúa la corrección; se mantienen identificados los clientes afectados.','8');

INSERT INTO historial_capacidad_segmento (id_segmento,fecha,capacidad_total_tbps,capacidad_utilizada_tbps,capacidad_reservada_tbps)
WITH RECURSIVE dias AS (
 SELECT DATE('2026-09-01') dia UNION ALL SELECT DATE_ADD(dia,INTERVAL 1 DAY) FROM dias WHERE dia<'2026-11-12'
), cortes AS (
 SELECT CASE WHEN dia='2026-11-12' THEN TIMESTAMP(dia,'12:00:00') ELSE TIMESTAMP(dia,'23:59:59') END fecha FROM dias
)
SELECT s.id_segmento,p.fecha,s.capacidad_total_tbps,
 COALESCE((SELECT SUM(v.capacidad_contratada_tbps) FROM servicio v JOIN servicio_segmento x ON x.id_servicio=v.id_servicio WHERE x.id_segmento=s.id_segmento AND v.fecha_activacion<=p.fecha AND (v.fecha_cancelacion IS NULL OR v.fecha_cancelacion>p.fecha)),0),
 COALESCE((SELECT SUM(r.capacidad_solicitada_tbps) FROM solicitud_capacidad r JOIN solicitud_segmento x ON x.id_solicitud=r.id_solicitud WHERE x.id_segmento=s.id_segmento AND x.fecha_reserva<=p.fecha AND NOT EXISTS(SELECT 1 FROM servicio v WHERE v.id_solicitud=r.id_solicitud AND v.fecha_activacion<=p.fecha)),0)
 FROM segmento s CROSS JOIN cortes p ORDER BY p.fecha,s.id_segmento;
SET @limite_concatenacion=@@SESSION.group_concat_max_len;
SET SESSION group_concat_max_len=16777216;
SET @desde='2026-09-01 00:00:00',@hasta='2026-09-30 23:59:59';
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0001','OPERACION_GENERAL',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 1,UNHEX(CONCAT('000000040005c381726561000743c3b36469676f000645737461646f00054665636861',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,''))) ORDER BY c0,c1,c2,c3 SEPARATOR ''),''))) FROM (SELECT 'Incidencia' c0,codigo_incidencia c1,fase c2,DATE_FORMAT(fecha_deteccion,'%d/%m/%Y %H:%i') c3 FROM incidencia WHERE fecha_deteccion BETWEEN @desde AND @hasta UNION ALL SELECT 'Mantenimiento',codigo_mantenimiento,fase,DATE_FORMAT(inicio_programado,'%d/%m/%Y %H:%i') FROM mantenimiento WHERE inicio_programado BETWEEN @desde AND @hasta UNION ALL SELECT 'Servicio',codigo_servicio,estado,DATE_FORMAT(fecha_activacion,'%d/%m/%Y %H:%i') FROM servicio WHERE fecha_activacion BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0002','CAPACIDAD_UTILIZACION',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 2,UNHEX(CONCAT('0000000500085365676d656e746f00054665636861000c546f74616c2028546270732900105574696c697a61646120285462707329001052657365727661646120285462707329',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT s.codigo_segmento c0,CAST(h.fecha AS CHAR) c1,CAST(h.capacidad_total_tbps AS CHAR) c2,CAST(h.capacidad_utilizada_tbps AS CHAR) c3,CAST(h.capacidad_reservada_tbps AS CHAR) c4 FROM historial_capacidad_segmento h JOIN segmento s ON s.id_segmento=h.id_segmento WHERE h.fecha BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0003','INCIDENCIAS',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 3,UNHEX(CONCAT('00000005000743c3b36469676f0009536576657269646164000645737461646f000a44657465636369c3b36e0009526573756c7461646f',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT codigo_incidencia c0,severidad c1,fase c2,CAST(fecha_deteccion AS CHAR) c3,COALESCE(resultado,'') c4 FROM incidencia WHERE fecha_deteccion BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0004','MANTENIMIENTOS',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 4,UNHEX(CONCAT('00000005000743c3b36469676f000645737461646f0011496e6963696f2070726f6772616d61646f000c446573637269706369c3b36e0009526573756c7461646f',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT codigo_mantenimiento c0,fase c1,CAST(inicio_programado AS CHAR) c2,descripcion c3,COALESCE(resultado,'') c4 FROM mantenimiento WHERE inicio_programado BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0005','SERVICIOS_CLIENTES',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 5,UNHEX(CONCAT('000000040008536572766963696f0007436c69656e7465001043617061636964616420285462707329000645737461646f',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,''))) ORDER BY c0,c1,c2,c3 SEPARATOR ''),''))) FROM (SELECT v.codigo_servicio c0,c.razon_social c1,CAST(v.capacidad_contratada_tbps AS CHAR) c2,v.estado c3 FROM servicio v JOIN solicitud_capacidad r ON r.id_solicitud=v.id_solicitud JOIN cliente c ON c.id_cliente=r.id_cliente WHERE COALESCE(v.fecha_activacion,r.fecha_solicitud)BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0006','INDICADORES_HISTORICOS',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 6,UNHEX(CONCAT('0000000500085365676d656e746f00054665636861000c546f74616c2028546270732900105574696c697a61646120285462707329001052657365727661646120285462707329',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT s.codigo_segmento c0,CAST(h.fecha AS CHAR) c1,CAST(h.capacidad_total_tbps AS CHAR) c2,CAST(h.capacidad_utilizada_tbps AS CHAR) c3,CAST(h.capacidad_reservada_tbps AS CHAR) c4 FROM historial_capacidad_segmento h JOIN segmento s ON s.id_segmento=h.id_segmento WHERE h.fecha BETWEEN @desde AND @hasta) filas;
SET @desde='2026-10-01 00:00:00',@hasta='2026-10-31 23:59:59';
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0007','OPERACION_GENERAL',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 7,UNHEX(CONCAT('000000040005c381726561000743c3b36469676f000645737461646f00054665636861',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,''))) ORDER BY c0,c1,c2,c3 SEPARATOR ''),''))) FROM (SELECT 'Incidencia' c0,codigo_incidencia c1,fase c2,DATE_FORMAT(fecha_deteccion,'%d/%m/%Y %H:%i') c3 FROM incidencia WHERE fecha_deteccion BETWEEN @desde AND @hasta UNION ALL SELECT 'Mantenimiento',codigo_mantenimiento,fase,DATE_FORMAT(inicio_programado,'%d/%m/%Y %H:%i') FROM mantenimiento WHERE inicio_programado BETWEEN @desde AND @hasta UNION ALL SELECT 'Servicio',codigo_servicio,estado,DATE_FORMAT(fecha_activacion,'%d/%m/%Y %H:%i') FROM servicio WHERE fecha_activacion BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0008','CAPACIDAD_UTILIZACION',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 8,UNHEX(CONCAT('0000000500085365676d656e746f00054665636861000c546f74616c2028546270732900105574696c697a61646120285462707329001052657365727661646120285462707329',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT s.codigo_segmento c0,CAST(h.fecha AS CHAR) c1,CAST(h.capacidad_total_tbps AS CHAR) c2,CAST(h.capacidad_utilizada_tbps AS CHAR) c3,CAST(h.capacidad_reservada_tbps AS CHAR) c4 FROM historial_capacidad_segmento h JOIN segmento s ON s.id_segmento=h.id_segmento WHERE h.fecha BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0009','INCIDENCIAS',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 9,UNHEX(CONCAT('00000005000743c3b36469676f0009536576657269646164000645737461646f000a44657465636369c3b36e0009526573756c7461646f',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT codigo_incidencia c0,severidad c1,fase c2,CAST(fecha_deteccion AS CHAR) c3,COALESCE(resultado,'') c4 FROM incidencia WHERE fecha_deteccion BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0010','MANTENIMIENTOS',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 10,UNHEX(CONCAT('00000005000743c3b36469676f000645737461646f0011496e6963696f2070726f6772616d61646f000c446573637269706369c3b36e0009526573756c7461646f',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT codigo_mantenimiento c0,fase c1,CAST(inicio_programado AS CHAR) c2,descripcion c3,COALESCE(resultado,'') c4 FROM mantenimiento WHERE inicio_programado BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0011','SERVICIOS_CLIENTES',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 11,UNHEX(CONCAT('000000040008536572766963696f0007436c69656e7465001043617061636964616420285462707329000645737461646f',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,''))) ORDER BY c0,c1,c2,c3 SEPARATOR ''),''))) FROM (SELECT v.codigo_servicio c0,c.razon_social c1,CAST(v.capacidad_contratada_tbps AS CHAR) c2,v.estado c3 FROM servicio v JOIN solicitud_capacidad r ON r.id_solicitud=v.id_solicitud JOIN cliente c ON c.id_cliente=r.id_cliente WHERE COALESCE(v.fecha_activacion,r.fecha_solicitud)BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0012','INDICADORES_HISTORICOS',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 12,UNHEX(CONCAT('0000000500085365676d656e746f00054665636861000c546f74616c2028546270732900105574696c697a61646120285462707329001052657365727661646120285462707329',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT s.codigo_segmento c0,CAST(h.fecha AS CHAR) c1,CAST(h.capacidad_total_tbps AS CHAR) c2,CAST(h.capacidad_utilizada_tbps AS CHAR) c3,CAST(h.capacidad_reservada_tbps AS CHAR) c4 FROM historial_capacidad_segmento h JOIN segmento s ON s.id_segmento=h.id_segmento WHERE h.fecha BETWEEN @desde AND @hasta) filas;
SET @desde='2026-11-01 00:00:00',@hasta='2026-11-12 23:59:59';
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0013','OPERACION_GENERAL',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 13,UNHEX(CONCAT('000000040005c381726561000743c3b36469676f000645737461646f00054665636861',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,''))) ORDER BY c0,c1,c2,c3 SEPARATOR ''),''))) FROM (SELECT 'Incidencia' c0,codigo_incidencia c1,fase c2,DATE_FORMAT(fecha_deteccion,'%d/%m/%Y %H:%i') c3 FROM incidencia WHERE fecha_deteccion BETWEEN @desde AND @hasta UNION ALL SELECT 'Mantenimiento',codigo_mantenimiento,fase,DATE_FORMAT(inicio_programado,'%d/%m/%Y %H:%i') FROM mantenimiento WHERE inicio_programado BETWEEN @desde AND @hasta UNION ALL SELECT 'Servicio',codigo_servicio,estado,DATE_FORMAT(fecha_activacion,'%d/%m/%Y %H:%i') FROM servicio WHERE fecha_activacion BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0014','CAPACIDAD_UTILIZACION',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 14,UNHEX(CONCAT('0000000500085365676d656e746f00054665636861000c546f74616c2028546270732900105574696c697a61646120285462707329001052657365727661646120285462707329',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT s.codigo_segmento c0,CAST(h.fecha AS CHAR) c1,CAST(h.capacidad_total_tbps AS CHAR) c2,CAST(h.capacidad_utilizada_tbps AS CHAR) c3,CAST(h.capacidad_reservada_tbps AS CHAR) c4 FROM historial_capacidad_segmento h JOIN segmento s ON s.id_segmento=h.id_segmento WHERE h.fecha BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0015','INCIDENCIAS',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 15,UNHEX(CONCAT('00000005000743c3b36469676f0009536576657269646164000645737461646f000a44657465636369c3b36e0009526573756c7461646f',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT codigo_incidencia c0,severidad c1,fase c2,CAST(fecha_deteccion AS CHAR) c3,COALESCE(resultado,'') c4 FROM incidencia WHERE fecha_deteccion BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0016','MANTENIMIENTOS',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 16,UNHEX(CONCAT('00000005000743c3b36469676f000645737461646f0011496e6963696f2070726f6772616d61646f000c446573637269706369c3b36e0009526573756c7461646f',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT codigo_mantenimiento c0,fase c1,CAST(inicio_programado AS CHAR) c2,descripcion c3,COALESCE(resultado,'') c4 FROM mantenimiento WHERE inicio_programado BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0017','SERVICIOS_CLIENTES',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 17,UNHEX(CONCAT('000000040008536572766963696f0007436c69656e7465001043617061636964616420285462707329000645737461646f',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,''))) ORDER BY c0,c1,c2,c3 SEPARATOR ''),''))) FROM (SELECT v.codigo_servicio c0,c.razon_social c1,CAST(v.capacidad_contratada_tbps AS CHAR) c2,v.estado c3 FROM servicio v JOIN solicitud_capacidad r ON r.id_solicitud=v.id_solicitud JOIN cliente c ON c.id_cliente=r.id_cliente WHERE COALESCE(v.fecha_activacion,r.fecha_solicitud)BETWEEN @desde AND @hasta) filas;
INSERT INTO reporte_generado (codigo_reporte,tipo,fecha_inicio,fecha_fin,generado_en,generado_por) VALUES ('REP-0018','INDICADORES_HISTORICOS',@desde,@hasta,'2026-11-12 12:00:00',4);
INSERT INTO reporte_contenido (id_reporte,contenido) SELECT 18,UNHEX(CONCAT('0000000500085365676d656e746f00054665636861000c546f74616c2028546270732900105574696c697a61646120285462707329001052657365727661646120285462707329',LPAD(HEX(COUNT(*)),8,'0'),COALESCE(GROUP_CONCAT(CONCAT(LPAD(HEX(OCTET_LENGTH(COALESCE(c0,''))),8,'0'),HEX(COALESCE(c0,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c1,''))),8,'0'),HEX(COALESCE(c1,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c2,''))),8,'0'),HEX(COALESCE(c2,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c3,''))),8,'0'),HEX(COALESCE(c3,'')),LPAD(HEX(OCTET_LENGTH(COALESCE(c4,''))),8,'0'),HEX(COALESCE(c4,''))) ORDER BY c0,c1,c2,c3,c4 SEPARATOR ''),''))) FROM (SELECT s.codigo_segmento c0,CAST(h.fecha AS CHAR) c1,CAST(h.capacidad_total_tbps AS CHAR) c2,CAST(h.capacidad_utilizada_tbps AS CHAR) c3,CAST(h.capacidad_reservada_tbps AS CHAR) c4 FROM historial_capacidad_segmento h JOIN segmento s ON s.id_segmento=h.id_segmento WHERE h.fecha BETWEEN @desde AND @hasta) filas;
SET SESSION group_concat_max_len=@limite_concatenacion;
