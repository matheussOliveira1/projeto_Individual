CREATE DATABASE webdemon;
USE webdemon;

CREATE TABLE Cadastro(
	idCadastro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90),
    sobrenome VARCHAR(90),
    email VARCHAR(90),
    senha VARCHAR(90),
    persFav VARCHAR(90) CONSTRAINT chkPersona CHECK (persFav = 'Asta' OR persFav = 'Liebe' OR persFav = 'Yuno')
);

INSERT INTO Cadastro VALUES
(NULL, 'Matheus', 'Alves', 'matheus@matheus.com', 'teste', 'Asta');
