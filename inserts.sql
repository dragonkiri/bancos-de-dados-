SELECT * FROM pessoa;
INSERT INTO pessoa(nome,cpf,idade,situacao) 
VALUES 
("jairo",78492393484,86,"a"), 
("rodrigues",785492393484,26,"a"),
("romeu",78492393094,44,"b"),
("rapha",78492329084,19,"b");

SELECT * FROM professor;
INSERT INTO professor(matricula,situacao,id_pessoa)
VALUES 
("8916","B",1),
("8918","A",3);


INSERT INTO aluno(matricula,situacao,id_pessoa)
VALUES 
("8345","A",2),
("8378","R",4);
