CREATE DATABASE escola;
USE escola;
SELECT * FROM  curso;
CREATE TABLE pessoa(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf INT(11) NOT NULL,
idade int (2),
situacao CHAR(1) NOT NULL);

CREATE TABLE aluno(
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
matricula INT NOT NULL,
situacao CHAR(1),
id_pessoa INT NOT NULL,
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa));

CREATE TABLE professor(
id_professor INT PRIMARY KEY AUTO_INCREMENT,
matricula INT NOT NULL,
situacao CHAR(1),
id_pessoa INT NOT NULL,
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa));

CREATE TABLE endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
cidade VARCHAR(30),
rua VARCHAR(30),
bairro VARCHAR(30),
cep INT (8) NOT NULL,
uf VARCHAR (2) NOT NULL,
situacao CHAR (1) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa));

CREATE TABLE curso(
id_curso INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(45) NOT NULL,
carga_horaria INT NOT NULL,
data_inicio DATE,
data_fim DATE,
situacao CHAR(1),
id_aluno INT NOT NULL,
FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno));

CREATE TABLE turma(
id_turma INT PRIMARY KEY AUTO_INCREMENT,
numero_sala INT NOT NULL,
capacidade INT NOT NULL,
situacao CHAR (1),
id_professor INT NOT NULL,
id_aluno INT NOT NULL,
id_curso INT NOT NULL,
FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno),
FOREIGN KEY(id_professor) REFERENCES professor(id_professor),
FOREIGN KEY(id_curso) REFERENCES curso(id_curso));
