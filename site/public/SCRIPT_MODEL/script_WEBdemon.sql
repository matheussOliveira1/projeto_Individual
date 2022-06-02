CREATE DATABASE webdemon;
USE webdemon;

CREATE TABLE Personagem(
	idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
    nomePersonagem VARCHAR(90) CONSTRAINT chkPersona CHECK (nomePersonagem = 'Asta' OR nomePersonagem = 'Liebe' OR nomePersonagem = 'Yuno')
);

INSERT INTO Personagem VALUES
(NULL, 'Asta'),
(NULL, 'Liebe'),
(NULL, 'Yuno');

CREATE TABLE Formulario(
	idCadastro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90),
    idade INT,
    sexo VARCHAR(9) CONSTRAINT chkSexo CHECK (sexo = 'masculino' OR sexo = 'feminino' OR sexo = 'outro'),
    fkPersFav INT,
    FOREIGN KEY (fkPersFav) REFERENCES Personagem (idPersonagem)
);

select * from personagem;

-- SELECTS QUE QUERO UTILIZAR:
-- HISTORICO UTILIZANDO UM 'SELECT *' COM ORDER BY id desc;
-- QUANTIDADE DE FORMULARIOS OU SEJA UM SELECT COUNT DOS ID;
-- PEGAR O PERSONAGEM MAIS VOTADO;
-- (TALVEZ) PEGAR A IDADE MEDIA DAS VOTAÇÕES;
