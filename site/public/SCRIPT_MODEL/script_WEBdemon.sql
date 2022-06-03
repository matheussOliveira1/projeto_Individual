CREATE DATABASE webdemon;
USE webdemon;

CREATE TABLE personagemFav(
	idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
    nomePersonagem VARCHAR(90) CONSTRAINT chkPersona CHECK (nomePersonagem = 'Asta' OR nomePersonagem = 'Liebe' OR nomePersonagem = 'Yuno')
);

INSERT INTO personagemFav VALUES
(NULL, 'Asta'),
(NULL, 'Liebe'),
(NULL, 'Yuno');

CREATE TABLE Formulario(
	idCadastro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90) NOT NULL,
    preferencia VARCHAR(45) CONSTRAINT chkPreferencia CHECK (preferencia = 'Mangá' OR preferencia = 'Anime') NOT NULL,
    respostaConclusao VARCHAR(45) CONSTRAINT checkResp CHECK (respostaConclusao = 'Sim' OR respostaConclusao = 'Não') NOT NULL,
    fkPersFav INT NOT NULL,
    FOREIGN KEY (fkPersFav) REFERENCES personagemFav (idPersonagem)
);

INSERT INTO Formulario VALUES
(NULL, 'Matheus', 'Anime', 'Sim', 1),
(NULL, 'Miguel', 'Anime', 'Não', 3),
(NULL, 'Vitor', 'Mangá', 'Não', 1),
(NULL, 'Nakamura', 'Mangá', 'Sim', 2),
(NULL, 'Julia', 'Anime', 'Não', 1);

select * from personagem;
select * from formulario;

-- SELECTS QUE QUERO UTILIZAR:


-- HISTORICO UTILIZANDO UM 'SELECT *' COM ORDER BY id desc;

SELECT * FROM Formulario ORDER BY idCadastro DESC;


-- QUANTIDADE DE FORMULARIOS OU SEJA UM SELECT COUNT DOS ID;

SELECT count(idCadastro) FROM Formulario; 

-- PEGAR O PERSONAGEM MAIS VOTADO; AINDA NÃO CONSEGUI

SELECT count(fkPersFav) FROM Formulario GROUP BY fkPersFav;

-- QUANTIDADE QUE PREFEREM ANIME:

SELECT count(preferencia) FROM Formulario WHERE preferencia = 'Anime';

-- QUANTIDADE QUE PREFEREM MANGÁ:

SELECT count(preferencia) FROM Formulario WHERE preferencia = 'Mangá';

-- QUANTIDADE QUE JÁ TERMINARAM O ANIME OU MANGÁ:

SELECT count(respostaConclusao) FROM Formulario WHERE respostaConclusao = 'Sim';
