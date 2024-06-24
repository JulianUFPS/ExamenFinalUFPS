CREATE TABLE semillero.programa (

	id INT auto_increment NOT NULL,

	codigo varchar(3) NOT NULL,

	nombre varchar(100) NOT NULL,

	CONSTRAINT programa_pk PRIMARY KEY (id),

	CONSTRAINT programa_unique UNIQUE KEY (codigo)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;





CREATE TABLE semillero.grupo (

	id INT auto_increment NOT NULL,

	nombre varchar(200) NULL,

	sigla varchar(20) NULL,

	CONSTRAINT grupo_pk PRIMARY KEY (id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.area (

	id INT auto_increment NOT NULL,

	nombre varchar(100) NULL,

	CONSTRAINT area_pk PRIMARY KEY (id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.departamento (

	id INT auto_increment NOT NULL,

	nombre varchar(100) NULL,

	CONSTRAINT departamento_pk PRIMARY KEY (id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.nivel_formacion (

	id INT auto_increment NOT NULL,

	nombre varchar(100) NULL,

	CONSTRAINT nivel_formacion_pk PRIMARY KEY (id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.director (

	id INT auto_increment NOT NULL,

	codigo varchar(10) NOT NULL,

	nombre varchar(100) NULL,

	identificacion varchar(20) NULL,

	cvlac varchar(500) NULL,

	nivel_formacion_id INT NULL,

	direccion varchar(500) NULL,

	telefono varchar(20) NULL,

	email varchar(100) NULL,

	fecha_nacimiento DATE NULL,

	departamento_id INT NULL,

	CONSTRAINT director_pk PRIMARY KEY (id),

	CONSTRAINT director_unique UNIQUE KEY (codigo),

	CONSTRAINT director_nivel_formacion_FK FOREIGN KEY (nivel_formacion_id) REFERENCES semillero.nivel_formacion(id),

	CONSTRAINT director_departamento_FK FOREIGN KEY (departamento_id) REFERENCES semillero.departamento(id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.semillero (

	id INT auto_increment NOT NULL,

	nombre varchar(200) NULL,

	sigla varchar(20) NULL,

	grupo_id INT NULL,

	area_id INT NULL,

	mision TEXT NULL,

	vision TEXT NULL,

	objetivo_general TEXT NULL,

	objetivo_especifico TEXT NULL,

	estrategia_trabajo TEXT NULL,

	director_id INT NULL,

	CONSTRAINT semillero_pk PRIMARY KEY (id),

	CONSTRAINT semillero_director_FK FOREIGN KEY (director_id) REFERENCES semillero.director(id),

	CONSTRAINT semillero_grupo_FK FOREIGN KEY (grupo_id) REFERENCES semillero.grupo(id),

	CONSTRAINT semillero_area_FK FOREIGN KEY (area_id) REFERENCES semillero.area(id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.linea (

	id INT auto_increment NOT NULL,

	semillero_id INT NULL,

	nombre varchar(100) NULL,

	descripcion TEXT NULL,

	estado BOOL NULL,

	CONSTRAINT linea_pk PRIMARY KEY (id),

	CONSTRAINT linea_semillero_FK FOREIGN KEY (semillero_id) REFERENCES semillero.semillero(id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.estudiante (

	id INT auto_increment NOT NULL,

	codigo varchar(10) NULL,

	nombre varchar(100) NULL,

	email varchar(100) NULL,

	telefono varchar(20) NULL,

	fecha_nacimiento DATE NULL,

	direccion varchar(200) NULL,

	CONSTRAINT estudiante_pk PRIMARY KEY (id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;





CREATE TABLE semillero.rol (

	id INT auto_increment NOT NULL,

	nombre varchar(100) NOT NULL,

	CONSTRAINT rol_pk PRIMARY KEY (id),

	CONSTRAINT rol_unique UNIQUE KEY (nombre)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;





CREATE TABLE semillero.integrante (

	id INT auto_increment NOT NULL,

	estudiante_id INT NULL,

	semillero_id INT NULL,

	estado BOOL DEFAULT true NULL,

	fecha_ingreso DATE NULL,

	rol_id INT NULL,

	fecha_retiro DATE NULL,

	CONSTRAINT integrante_pk PRIMARY KEY (id),

	CONSTRAINT integrante_rol_FK FOREIGN KEY (rol_id) REFERENCES semillero.rol(id),

	CONSTRAINT integrante_semillero_FK FOREIGN KEY (semillero_id) REFERENCES semillero.semillero(id),

	CONSTRAINT integrante_estudiante_FK FOREIGN KEY (estudiante_id) REFERENCES semillero.estudiante(id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.periodo (

	id INT auto_increment NOT NULL,

	fecha_inicio DATE NULL,

	fecha_fin DATE NULL,

	descripcion varchar(50) NULL,

	CONSTRAINT periodo_pk PRIMARY KEY (id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.inscrito (

	integrante_id INT NULL,

	periodo_id INT NULL,

	CONSTRAINT inscrito_pk PRIMARY KEY (integrante_id,periodo_id),

	CONSTRAINT inscrito_periodo_FK FOREIGN KEY (periodo_id) REFERENCES semillero.periodo(id),

	CONSTRAINT inscrito_integrante_FK FOREIGN KEY (integrante_id) REFERENCES semillero.integrante(id)



)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;





CREATE TABLE semillero.capacitacion (

	id INT auto_increment NOT NULL,

	nombre varchar(500) NULL,

	objetivo varchar(500) NULL,

	fecha_inicio_plan DATE NULL,

	fecha_fin_plan DATE NULL,

	integrante_id INT NULL,

	asistentes_esperados INT NULL,

	fecha_inicio_realizada DATE NULL,

	fecha_fin_realizada DATE NULL,

	observaciones TEXT NULL,

	periodo_id INT NULL,

	semillero_id INT NULL,

	CONSTRAINT capacitacion_pk PRIMARY KEY (id),

	CONSTRAINT capacitacion_integrante_FK FOREIGN KEY (integrante_id) REFERENCES semillero.integrante(id),

	CONSTRAINT capacitacion_periodo_FK FOREIGN KEY (periodo_id) REFERENCES semillero.periodo(id),

	CONSTRAINT capacitacion_semillero_FK FOREIGN KEY (semillero_id) REFERENCES semillero.semillero(id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;





CREATE TABLE semillero.asistencia (

	id INT auto_increment NOT NULL,

	capacitacion_id INT NULL,

	integrante_id INT NULL,

	fecha_registro DATETIME DEFAULT NOW() NULL,

	CONSTRAINT asistencia_pk PRIMARY KEY (id),

	CONSTRAINT asistencia_unique UNIQUE KEY (capacitacion_id,integrante_id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



ALTER TABLE semillero.asistencia ADD CONSTRAINT asistencia_capacitacion_FK FOREIGN KEY (capacitacion_id) REFERENCES semillero.capacitacion(id);

ALTER TABLE semillero.asistencia ADD CONSTRAINT asistencia_integrante_FK FOREIGN KEY (integrante_id) REFERENCES semillero.integrante(id);





CREATE TABLE semillero.proyecto (

	id INT auto_increment NOT NULL,

	nombre varchar(200) NULL,

	linea_id INT NULL,

	objetivo_general TEXT NULL,

	responsable_id INT NULL,

	fecha_inicio DATE NULL,

	fecha_fin DATE NULL,

	CONSTRAINT proyecto_pk PRIMARY KEY (id),

	CONSTRAINT proyecto_linea_FK FOREIGN KEY (linea_id) REFERENCES semillero.linea(id),

	CONSTRAINT proyecto_integrante_FK FOREIGN KEY (responsable_id) REFERENCES semillero.integrante(id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.actividad (

	id INT auto_increment NOT NULL,

	proyecto_id INT NULL,

	actividad varchar(500) NULL,

	descripcion TEXT NULL,

	fecha_inicio DATE NULL,

	fecha_fin DATE NULL,

	resultado TEXT NULL,

	producto TEXT NULL,

	responsable_id INT NULL,

	CONSTRAINT actividad_pk PRIMARY KEY (id),

	CONSTRAINT actividad_integrante_FK FOREIGN KEY (responsable_id) REFERENCES semillero.integrante(id),

	CONSTRAINT actividad_proyecto_FK FOREIGN KEY (proyecto_id) REFERENCES semillero.proyecto(id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.evento_nivel (

	id INT auto_increment NOT NULL,

	descripcion varchar(100) NULL,

	CONSTRAINT evento_nivel_pk PRIMARY KEY (id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.evento (

	id INT auto_increment NOT NULL,

	nombre varchar(200) NULL,

	nivel_id INT NULL,

	fecha_realizacion DATE NULL,

	lugar varchar(100) NULL,

	descripcion TEXT NULL,

	CONSTRAINT evento_pk PRIMARY KEY (id),

	CONSTRAINT evento_evento_nivel_FK FOREIGN KEY (nivel_id) REFERENCES semillero.evento_nivel(id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.modalidad (

	id INT auto_increment NOT NULL,

	descripcion varchar(100) NULL,

	CONSTRAINT modalidad_pk PRIMARY KEY (id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.producto_tipo (

	id INT auto_increment NOT NULL,

	descripcion varchar(100) NULL,

	CONSTRAINT producto_tipo_pk PRIMARY KEY (id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



CREATE TABLE semillero.participacion (

	id INT auto_increment NOT NULL,

	evento_id INT NULL,

	proyecto_id INT NULL,

	modalidad_id INT NULL,

	producto_tipo_id INT NULL,

	fecha DATE NULL,

	observacion TEXT NULL,

	descripcion varchar(500) NULL,

	integrante_id INT NULL,

	CONSTRAINT participacion_pk PRIMARY KEY (id),

	CONSTRAINT participacion_modalidad_FK FOREIGN KEY (modalidad_id) REFERENCES semillero.modalidad(id),

	CONSTRAINT participacion_evento_FK FOREIGN KEY (evento_id) REFERENCES semillero.evento(id),

	CONSTRAINT participacion_proyecto_FK FOREIGN KEY (proyecto_id) REFERENCES semillero.proyecto(id),

	CONSTRAINT participacion_producto_tipo_FK FOREIGN KEY (producto_tipo_id) REFERENCES semillero.producto_tipo(id),

	CONSTRAINT participacion_integrante_FK FOREIGN KEY (integrante_id) REFERENCES semillero.integrante(id)

)

ENGINE=InnoDB

DEFAULT CHARSET=latin1

COLLATE=latin1_swedish_ci;



ALTER TABLE semillero.estudiante ADD programa_id INT NULL;

ALTER TABLE semillero.estudiante ADD CONSTRAINT estudiante_programa_FK FOREIGN KEY (programa_id) REFERENCES semillero.programa(id);


Y adicional se tiene el DML de algunos registros:
INSERT INTO semillero.evento_nivel (descripcion) VALUES

	 ('local'),

	 ('regional'),

	 ('nacional'),

	 ('internacional');



INSERT INTO semillero.producto_tipo (descripcion) VALUES

	 ('Ponencia'),

	 ('Artículo');



INSERT INTO semillero.modalidad (descripcion) VALUES

	 ('Ponente'),

	 ('Asistente');



INSERT INTO semillero.programa (codigo,nombre) VALUES

	 ('115','Ingeniería de Sistemas'),

	 ('116','Ingeniería Industrial'),

	 ('119','Ingeniería Electrónica');



INSERT INTO semillero.nivel_formacion (nombre) VALUES

	 ('Pregrado'),

	 ('Especialista'),

	 ('Magister'),

	 ('Doctorado');



INSERT INTO semillero.rol (nombre) VALUES

	 ('Instructor'),

	 ('Lider'),

	 ('Participante’);



INSERT INTO semillero.departamento (nombre) VALUES

	 ('Departamento de Sistemas e Informática'),

	 ('Departamento de Ciencias Agrarias');



INSERT INTO semillero.area (nombre) VALUES

	 ('Ciencias Agrarias'),

	 ('Ingenierías'),

	 ('Ciencias de la Salud y el Deporte'),

	 ('Ciencias Humanas'),

	 ('Lingüística, Artes y Letras'),

	 ('Ciencias Biológicas y del Mar'),

	 ('Ciencias Sociales'),

	 ('Ciencias Exactas y de la Tierra'),

	 ('Navales y de Seguridad'),

	 ('Multidisciplinario');



INSERT INTO semillero.grupo (nombre,sigla) VALUES

	 ('Grupo de Investigación de Inteligencia Artificial','GIDISOFT'),

	 ('Grupo de Investigación de Inteligencia Artificial','GIA');



INSERT INTO semillero.periodo (fecha_inicio,fecha_fin,descripcion) VALUES

	 ('2023-01-01','2023-06-30','Semestre 2023-1'),

	 ('2023-07-01','2023-12-31','Semestre 2023-2'),

	 ('2024-01-01','2024-06-30','Semestre 2024-1'),

	 ('2024-07-01','2024-12-31','Semestre 2024-2');



INSERT INTO semillero.evento (nombre,nivel_id,fecha_realizacion,lugar,descripcion) VALUES

	 ('Red Colsi Norte de Santander 2024',2,'2024-05-15','Pamplona',NULL),

	 ('Red Colsi Santander',2,'2024-04-15','Bucaramanga',NULL),

	 ('Red Colsi Nacional 2024',3,'2024-09-14','Cartagena',NULL);



INSERT INTO semillero.semillero (nombre,sigla,grupo_id,area_id,mision,vision,objetivo_general,objetivo_especifico,estrategia_trabajo,director_id) VALUES

	 ('Semillero de Investigación de Aplicaciones WEB','SIAWEB',1,2,'Lalalala','Lalalala','Lalalala','Lalalala','Lalalala',1),

	 ('Semillero de Millonarios','MILLOS',2,3,'Lalalala','Lalalala','Lalalala','Lalalala','Lalalala',2);





INSERT INTO semillero.linea (semillero_id,nombre,descripcion,estado) VALUES

	 (1,'Aplicaciones Web','Lalalala',1),

	 (1,'Sistemas Distribuidos','Lalalala',1),

	 (2,'Goleadores','Lalalala',1),

	 (2,'Equipos de Colombia','Lalalala',1);



INSERT INTO semillero.estudiante (codigo,nombre,email,telefono,fecha_nacimiento,direccion,programa_id) VALUES

	 ('1151111','Juan Olmedo','juan@ufps.edu.co','1234567890','2006-01-01','Calle',1),

	 ('1151112','Maria Ovallos','maria@ufps.edu.co','1234567891','2006-01-01','Calle',1),

	 ('1151113','Diana Uribe','diana@ufps.edu.co','1234567892','2006-01-01','Calle',1),

	 ('1161113','Mario Iguaran','mario@ufps.edu.co','1234567892','2006-01-01','Calle',2);



INSERT INTO semillero.integrante (estudiante_id,semillero_id,estado,fecha_ingreso,rol_id,fecha_retiro) VALUES

	 (1,1,1,'2023-01-01',1,NULL),

	 (2,1,1,'2023-01-01',2,NULL),

	 (4,2,1,'2023-07-01',1,NULL);



INSERT INTO semillero.proyecto (nombre,linea_id,objetivo_general,responsable_id,fecha_inicio,fecha_fin) VALUES

	 ('AHP',1,'Lalalala',1,'2023-01-01','2023-08-31'),

	 ('Millos',4,'Lalalala',3,'2024-07-01','2024-11-01');





INSERT INTO semillero.actividad (proyecto_id,actividad,descripcion,fecha_inicio,fecha_fin,resultado,producto,responsable_id) VALUES

	 (1,'Desarrollo de diseño','Lalalala','2023-01-01','2023-03-31','Lalalala','Diseño',NULL),

	 (1,'Modelo de datos','Lalalala','2023-04-01','2024-04-30','Lalalala','Modelo',NULL),

	 (2,'Ganar los partidos de primera ronda','Lalalala','2024-07-15','2024-11-01','Lalalala','Muchos puntos',NULL),

	 (2,'Ganar la final','Lalalala','2024-11-12','2024-12-14','Lalalala','Copa',NULL);





INSERT INTO semillero.capacitacion (nombre,objetivo,fecha_inicio_plan,fecha_fin_plan,integrante_id,asistentes_esperados,fecha_inicio_realizada,fecha_fin_realizada,observaciones,periodo_id,semillero_id) VALUES

	 ('HTML','Lalalala','2024-02-01','2024-02-08',1,15,NULL,NULL,NULL,NULL,NULL),

	 ('JS','Lalalala','2024-02-01','2024-02-08',2,15,NULL,NULL,NULL,NULL,NULL),

	 ('Goles','Lalalala','2024-08-01','2024-08-08',3,15,NULL,NULL,NULL,NULL,NULL);