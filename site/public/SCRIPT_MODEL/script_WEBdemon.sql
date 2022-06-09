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
	idFormulario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90) NOT NULL,
    preferencia VARCHAR(45) CONSTRAINT chkPreferencia CHECK (preferencia = 'Mangá' OR preferencia = 'Anime') NOT NULL,
    respostaConclusao VARCHAR(45) CONSTRAINT checkResp CHECK (respostaConclusao = 'Sim' OR respostaConclusao = 'Não') NOT NULL,
    fkPersFav INT NOT NULL,
    FOREIGN KEY (fkPersFav) REFERENCES personagemFav (idPersonagem)
);

select * from personagemFav;
select * from formulario;


-- SELECTS QUE QUERO UTILIZAR:

-- HISTORICO DE VOTAÇÕES
SELECT idFormulario, nome, nomePersonagem, preferencia, respostaConclusao FROM Formulario JOIN personagemFav ON fkPersFav = idPersonagem ORDER BY idFormulario DESC;

-- QUANTIDADE DE FORMULARIOS OU SEJA UM SELECT COUNT DOS ID;
SELECT count(idFormulario) AS votosTotais FROM Formulario; 

-- PEGAR O PERSONAGEM MAIS VOTADO;
SELECT nomePersonagem, count(fkPersFav) AS votosPersFav FROM Formulario JOIN personagemFav ON fkPersFav = idPersonagem GROUP BY nomePersonagem ORDER BY votosPersFav DESC LIMIT 1;

-- QUANTIDADE QUE PREFEREM ANIME:
SELECT count(preferencia) AS votosAnime FROM Formulario WHERE preferencia = 'anime';

-- QUANTIDADE QUE PREFEREM MANGÁ:
SELECT count(preferencia) AS votosManga FROM Formulario WHERE preferencia = 'manga';

-- QUANTIDADE QUE JÁ TERMINARAM O ANIME OU MANGÁ:
SELECT count(respostaConclusao) as votosTerminaram FROM Formulario WHERE respostaConclusao = 'sim';
