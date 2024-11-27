SELECT * FROM consulta;

-- DROP TABLE REMOVE UMA TABELA --


CREATE TABLE pessoa (
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(11) NOT NULL,
data_nascimento DATE,
rg VARCHAR(7),
telefone VARCHAR(14),
email VARCHAR(45),
situacao CHAR(1)
);


CREATE TABLE paciente (
id_paciente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
numero_sus VARCHAR(20),
plano_saude VARCHAR(45),
observacao VARCHAR(100),
situacao CHAR (1),
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE medico (
id_medico INT PRIMARY KEY AUTO_INCREMENT,
crm VARCHAR(6) NOT NULL,
especialidade VARCHAR(45) NOT NULL,
salario DECIMAL (10,2),
situacao CHAR (1),
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE consulta (
id_consulta INT PRIMARY KEY AUTO_INCREMENT,
tipo_consulta VARCHAR(45) NOT NULL,
data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
stats VARCHAR(45) NOT NULL,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

SELECT * FROM pessoa;
INSERT INTO pessoa(nome, cpf ,data_nascimento ,rg ,telefone ,email ,situacao)
VALUES ('João Paulo','12345678900','2000-10-10','125611','6191928397','teste@teste.com','A'),
('Rafael Melo','98765432100','2000-10-10','125611','6191928397','teste@teste.com','A'),
('Yan Felipe','56734512311','2000-10-10','125611','6191928397','teste@teste.com','A'),
('Ruan Lobo','78945612300','2000-10-10','125611','6191928397','teste@teste.com','A'),
('Talisson Dourado','','2000-10-10','125611','6191928397','teste@teste.com','A'),
('Gabriel','00098721600','2000-10-10','125611','6191928397','teste@teste.com','A'),
('Guilherme Soares','00098721600','2000-10-10','125611','6191928397','teste@teste.com','A');

SELECT *FROM MEDICO;
INSERT INTO MEDICO(crm,especialidade,salario,situacao,id_pessoa) 
values 
("345098",'kiropraxista',12000.00,"o",3),
("345165",'urologista',7000.00,"f",5);

SELECT *FROM paciente;
INSERT INTO paciente(nome,numero_sus,plano_saude,observacao,id_pessoa) 
VALUES
("Ruan lobo",'45645869715346978521','credfaz',"paciente com hemorroida",4),
("Joao Paulo",'45645869715347615521','nao tem',"paciente com cancer",1),
("Rafael Melo",'45645864625347615521','segurado por deus',"paciente sono",2),
("Gabriel",'45645869715347617201','nao tem',"paciente enjoado",6);

SELECT 
pp.nome AS nome_paciente,
pp.cpf AS cpf_paciente,
pm.nome AS nome_medico,
pm.cpf AS cpf_medico,
c.tipo_consulta,
c.data_consulta,
c.stats,
p.numero_sus,
p.plano_saude,
m.crm,
m.especialidade
 FROM consulta c # id_paciente id_medico
 INNER JOIN paciente p ON c.id_paciente = p.id_paciente # id_pessoa
 INNER JOIN pessoa pp ON pp.id_pessoa = p.id_pessoa
 INNER JOIN medico m ON m.id_medico = c.id_medico #id_pessoa
 INNER JOIN pessoa pm ON pm.id_pessoa = m.id_pessoa

