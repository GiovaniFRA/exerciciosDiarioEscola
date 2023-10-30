--Tabela Aluno e sequência
CREATE TABLE ALUNO(
   id number PRIMARY KEY,
   nome varchar(100)
);

CREATE SEQUENCE id_aluno_seq
  START WITH 1      
  INCREMENT BY 1; 


--Tabela Responsavel e sequência
CREATE TABLE RESPONSAVEL(
   id number PRIMARY KEY,
   nome varchar(100)
);

CREATE SEQUENCE id_responsavel_seq
  START WITH 1      
  INCREMENT BY 1;

--Tabela Parentesco e relacionamento
CREATE TABLE PARENTESCO(
   ID NUMBER PRIMARY KEY,
   ID_RESPONSAVEL NUMBER,
   ID_ALUNO NUMBER,
   PARENTESCO varchar(100)
);

ALTER TABLE PARENTESCO
ADD CONSTRAINT fk_responsavel
FOREIGN KEY (ID_RESPONSAVEL) REFERENCES RESPONSAVEL(id);

ALTER TABLE PARENTESCO
ADD CONSTRAINT fk_aluno
FOREIGN KEY (ID_ALUNO) REFERENCES ALUNO(id);

CREATE SEQUENCE id_parentesco_seq
  START WITH 1      
  INCREMENT BY 1;

INSERT INTO Aluno (id,nome)
VALUES (id_aluno_seq.NEXTVAL,'Lucas');

INSERT INTO Responsavel (id,nome)
VALUES (id_Responsavel_seq.NEXTVAL,'Pablo');

INSERT INTO PARENTESCO(id,ID_RESPONSAVEL,ID_ALUNO,PARENTESCO)
VALUES(id_parentesco_seq.NEXTVAL,1,1,'pai'); 

INSERT INTO Responsavel (id,nome)
VALUES (id_Responsavel_seq.NEXTVAL,'Brenda');

INSERT INTO PARENTESCO(id,ID_RESPONSAVEL,ID_ALUNO,PARENTESCO)
VALUES(id_parentesco_seq.NEXTVAL,2,1,'mãe'); 

SELECT 
    aluno.nome, 
    (SELECT MAX(pai.nome) 
    FROM responsavel pai
    INNER JOIN parentesco pai_parentesco ON pai_parentesco.id_responsavel = pai.id
    ) AS responsavel,

    (SELECT MAX(parentesco_pai.parentesco)
     FROM parentesco parentesco_pai
     INNER JOIN responsavel ON responsavel.id = parentesco_pai.id_responsavel     
    ) As parentesco, 

    (SELECT MIN(mae.nome) 
    FROM responsavel mae
    INNER JOIN parentesco mae_parentesco ON mae_parentesco.id_responsavel = mae.id
    ) AS responsavel,

    (SELECT MIN(parentesco_mae.parentesco)
    FROM parentesco parentesco_mae
    INNER JOIN responsavel ON responsavel.id = parentesco_mae.id_responsavel
    ) As parentesco

FROM aluno
WHERE aluno.id = 1




