CREATE TABLE paciente (
id_paciente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
dni VARCHAR(15) UNIQUE,
fecha_nac DATE,
telefono VARCHAR(20),
email VARCHAR(100)
);


CREATE TABLE especialidad (
id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50)
);


CREATE TABLE medico (
id_medico INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
matricula VARCHAR(20) UNIQUE,
id_especialidad INT,
FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

CREATE TABLE consultorio (
id_consultorio INT AUTO_INCREMENT PRIMARY KEY,
numero VARCHAR(10),
piso INT
);


CREATE TABLE turno (
id_turno INT AUTO_INCREMENT PRIMARY KEY,
id_paciente INT,
id_medico INT,
id_consultorio INT,
fecha DATE,
hora TIME,
estado VARCHAR(20),
FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
FOREIGN KEY (id_consultorio) REFERENCES consultorio(id_consultorio),
INDEX idx_estado (estado)
);

CREATE TABLE atencion (
id_atencion INT AUTO_INCREMENT PRIMARY KEY,
id_turno INT,
diagnostico TEXT,
observaciones TEXT,
FOREIGN KEY (id_turno) REFERENCES turno(id_turno)
);