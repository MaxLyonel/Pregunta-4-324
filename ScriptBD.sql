CREATE TABLE usuario
( ci INTEGER NOT NULL ,  
usuario VARCHAR(50) NOT NULL ,  
password VARCHAR(60) NOT NULL ,   
tipo VARCHAR(30) NOT NULL, 
PRIMARY KEY  (ci)
);
INSERT INTO usuario (ci, usuario, password, tipo) VALUES (9101918, 'leonel','123', 'estudiante');
INSERT INTO usuario (ci, usuario, password, tipo) VALUES (6514812, 'maximo','321', 'estudiante');
INSERT INTO usuario (ci, usuario, password, tipo) VALUES (7811172, 'vargas','333', 'estudiante');
INSERT INTO usuario (ci, usuario, password, tipo) VALUES (3451120, 'ramirez','444', 'docente');
INSERT INTO usuario (ci, usuario, password, tipo) VALUES (2228611, 'jose','555', 'docente');
INSERT INTO usuario (ci, usuario, password, tipo) VALUES (7331231, 'juan','666', 'estudiante');
INSERT INTO usuario (ci, usuario, password, tipo) VALUES (1231123, 'maria','777', 'estudiante');
INSERT INTO usuario (ci, usuario, password, tipo) VALUES (9176112, 'ana','888', 'estudiante');
INSERT INTO usuario (ci, usuario, password, tipo) VALUES (7812172, 'kevin','999', 'estudiante');
INSERT INTO usuario (ci, usuario, password, tipo) VALUES (7812311, 'pepe','000', 'estudiante');

CREATE TABLE estudiante
( ci INTEGER NOT NULL , 
ru INTEGER NOT NULL , 
PRIMARY KEY (ci)
);
INSERT INTO estudiante (ci, ru) VALUES (9101918, 786);
INSERT INTO estudiante (ci, ru) VALUES (6514812, 136);
INSERT INTO estudiante (ci, ru) VALUES (7811172, 451);
INSERT INTO estudiante (ci, ru) VALUES (7331231, 951);
INSERT INTO estudiante (ci, ru) VALUES (1231123, 051);
INSERT INTO estudiante (ci, ru) VALUES (9176112, 611);
INSERT INTO estudiante (ci, ru) VALUES (7812172, 411);
INSERT INTO estudiante (ci, ru) VALUES (7812311, 457);


CREATE TABLE nota
( id INT NOT NULL,  
nota1 INT NOT NULL ,  
nota2 INT NOT NULL ,  
nota3 INT NOT NULL ,  
notafinal INT NOT NULL, 
ci_estudiante INT NOT NULL ,    
PRIMARY KEY  (id)
) ;


INSERT INTO nota (id,nota1,nota2,nota3,notafinal,ci_estudiante) VALUES (1,65,78,51,65,9101918);
INSERT INTO nota (id,nota1,nota2,nota3,notafinal,ci_estudiante) VALUES (2,33,58,81,57,6514812);
INSERT INTO nota (id,nota1,nota2,nota3,notafinal,ci_estudiante) VALUES (3,23,49,82,75,7811172); 
INSERT INTO nota (id,nota1,nota2,nota3,notafinal,ci_estudiante) VALUES (4,61,18,99,59,7331231);
INSERT INTO nota (id,nota1,nota2,nota3,notafinal,ci_estudiante) VALUES (5,91,78,52,73,1231123);
INSERT INTO nota (id,nota1,nota2,nota3,notafinal,ci_estudiante) VALUES (6,63,57,56,58,9176112);
INSERT INTO nota (id,nota1,nota2,nota3,notafinal,ci_estudiante) VALUES (7,33,47,51,43,7812172);
INSERT INTO nota (id,nota1,nota2,nota3,notafinal,ci_estudiante) VALUES (8,23,21,48,30,7812311);

CREATE TABLE persona 
( ci INT NOT NULL ,  
nombre VARCHAR(50) NOT NULL ,  
paterno VARCHAR(50) NOT NULL ,  
materno VARCHAR(50) NOT NULL ,  
fec_nac VARCHAR(10) NOT NULL ,  
departamento VARCHAR(3) NOT NULL ,    
PRIMARY KEY  (ci)
);

INSERT INTO persona (ci, nombre, paterno, materno, fec_nac, departamento) VALUES (9101918, 'leonel','Vargas', 'Ramirez','01/10/2021','01');
INSERT INTO persona (ci, nombre, paterno, materno, fec_nac, departamento) VALUES (6514812, 'Maximiliano','Flores', 'Mamani','11/10/2021','03');
INSERT INTO persona (ci, nombre, paterno, materno, fec_nac, departamento) VALUES (7811172, 'Roberto','Quispe', 'Huanca','21/10/2021','05');
INSERT INTO persona (ci, nombre, paterno, materno, fec_nac, departamento) VALUES (7331231, 'Juan','Guzman', 'Prada','21/10/2021','05');
INSERT INTO persona (ci, nombre, paterno, materno, fec_nac, departamento) VALUES (1231123, 'Maria','Loayza', 'Chuquimia','22/10/2021','03');
INSERT INTO persona (ci, nombre, paterno, materno, fec_nac, departamento) VALUES (9176112, 'Ana','Rivera', 'Beltran','02/10/2021','05');
INSERT INTO persona (ci, nombre, paterno, materno, fec_nac, departamento) VALUES (7812172, 'Kevin','Rosales', 'Huanca','21/10/2021','05');
INSERT INTO persona (ci, nombre, paterno, materno, fec_nac, departamento) VALUES (7812311, 'Jose','Quispe', 'Quisbert','04/10/2021','01');
INSERT INTO persona (ci, nombre, paterno, materno, fec_nac, departamento) VALUES (3451120, 'Alison','Ramirez', 'Velarde','01/10/2021','08');
INSERT INTO persona (ci, nombre, paterno, materno, fec_nac, departamento) VALUES (2228611, 'Yesenia','Gutierrez', 'Zelada','01/10/2021','08');


CREATE TABLE docente
( ci INT NOT NULL ,  
nro_doc INT NOT NULL ,    
PRIMARY KEY  (ci)
);
INSERT INTO docente (ci, nro_doc) VALUES (3451120, 3457);
INSERT INTO docente (ci, nro_doc) VALUES (2228611, 1417);

select p.departamento, avg(n.notafinal)
from estudiante e, persona p, nota n
where e.ci = p.ci
and e.ci = n.ci_estudiante
group by p.departamento

select avg(n.notafinal) as promedio, case departamento when '01' then 'CHUQUISACA'
							when '02' then 'LA PAZ'
							when '03' then 'CBBA'
							when '04' then 'ORURO'
							when '05' then 'POTOSI'
							when '06' then 'TARIJA'
							when '07' then 'SANTA CRUZ'
							when '08' then 'BENI'
							when '09' then 'PANDO'
							else 'OTRO' end as descripcion_depto
from persona p, estudiante e, nota n
where p.ci = e.ci
and n.ci_estudiante = e.ci
group by departamento

