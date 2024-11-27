CREATE DATABASE empreiteira;
USE empreiteira;
CREATE TABLE pessoa(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf_CNPJ VARCHAR(14) NOT NULL,
nome_fantasia VARCHAR(45),
telefone VARCHAR(9),
situacao CHAR (1));

CREATE TABLE endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(20),
cidade VARCHAR(30) NOT NULL,
uf CHAR(2) NOT NULL,
bairro VARCHAR(20),
cep VARCHAR(8) NOT NULL,
situacao CHAR(1) NOT NULL
); 
 
 CREATE TABLE colaborador(
 id_colaborador INT PRIMARY KEY AUTO_INCREMENT,
  funcao VARCHAR(20) NOT NULL,
  matricula INT(10) NOT NULL,
  salario INT(10)NOT NULL,
  tipo_contrato CHAR(3) NOT NULL,
  SITUACAO CHAR(1)NOT NULL,
  id_pessoa INT NOT NULL,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
  );
 
 CREATE TABLE projeto(
 id_projeto INT PRIMARY KEY AUTO_INCREMENT,
 VALOR VARCHAR(10.2) NOT NULL,
 tipo_projeto VARCHAR (10) NOT NULL,
 nome_projeto VARCHAR (20) NOT NULL,
 data_inicio DATE NOT NULL,
 previsao DATE,
 data_fim DATE,
 status CHAR(1),
 id_colaborador INT NOT NULL,
 FOREIGN KEY (id_colaborador) REFERENCES colaborador(id_pessoa)
 );
 
 CREATE TABLE empreiteira(
 id_empreiteira INT PRIMARY KEY AUTO_INCREMENT,
 area_atuacao VARCHAR(20) NOT NULL,
 tipo_contrato VARCHAR(10) NOT NULL,
 situacao CHAR(1) NOT NULL,
 id_pessoa INT NOT NULL,
 FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa));
 
 
 CREATE TABLE OBRA (
 id_obra INT PRIMARY KEY AUTO_INCREMENT,
 data_inicio DATE NOT NULL,
 previsao DATE,
 data_fim DATE,
 status CHAR(1),
 id_colaborador INT NOT NULL,
 id_empreiteira INT NOT NULL,
 id_projeto INT NOT NULL,
 FOREIGN KEY (id_colaborador) REFERENCES colaborador(id_colaborador),
 FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto),
 FOREIGN KEY (id_empreiteira) REFERENCES empreiteira(id_empreiteira)
 );
 
 SELECT * FROM PESSOA;
 INSERT  INTO PESSOA(nome,cpf_cnpj,nome_fantasia,telefone,situacao)
 values 
 ('douglas',07725634985, 'conserta_tudo ltda',61984652231,'o'),
 ('yan',07725981985, 'abaixo_infra ltda',61987216231,'d'),
 ('talisson',07296481985, 'manu_int',61982309231,'m'),
 ('gabriel',09078981985, null,61983889231,'e'),
 ('ruan',07729465234, null,61987894631,'e'),
 ('andy',07789281985, null,61988462231,'e'),
 ('fabricio',07798453167, null,61946798216,'e'),
 ('joao',95631548967, null,61987653154,'e'),
 ('daiana',07729876423, null,61997876251,'e');
  SELECT * FROM colaborador;
 INSERT  INTO colaborador(funcao,matricula,salario,tipo_contrato,situacao,id_pessoa)
 values 
 ('arquiteto',5139853,8000,'clt','o',4),
 ('mestre de obra',2901532,8500,'clt','o',5),
 ('arquiteto',5896423,6000,'pj','o',6),
 ('mestre de obra',9752143,8940,'clt','o',7),
 ('arquiteto',9864203,10000,'clt','o',8),
 ('mestre de obra',9751433,5000,'pj','o',9);
 
 SELECT * FROM projeto;
 INSERT  INTO projeto(valor,tipo_projeto,nome_projeto,data_inicio,previsao,data_fim,status,id_colaborador)
 values 
 (200000000,'reforma','galeria dos estados','2025-06-03','2026-05-05',null,'o',4 ),
 (250000000,'reforma','ponte do fundador','2024-08-12','2026-03-06','2027-09-09','o',6 ),
 (100500000,'construçao','estatuas do brasil','2023-06-03','2028-08-05',null,'o',8 );
