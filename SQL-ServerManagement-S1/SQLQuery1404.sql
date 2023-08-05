-- Criar banco do app UBER

CREATE DATABASE uber

-- Utilizar o banco

USE uber

-- Criar as tabelas

CREATE TABLE veiculo (
	placa VARCHAR(8) PRIMARY KEY, --Definido a PK
	modelo VARCHAR(40) NOT NULL, -- Não aceita nulo
	ano INT, 
	preco DECIMAL(10,2), -- 8 inteiros com 2 decimais
	dataCompra	SMALLDATETIME
)

CREATE TABLE Motorista (
	cnh INT NOT NULL, --Será nossa PK, por isso not null
	nome VARCHAR(88),
	PRIMARY KEY(cnh) --Define PK
)

CREATE TABLE Permissao (
	placa VARCHAR(8) NOT NULL,
	cnh INT NOT NULL,
	PRIMARY KEY (placa, cnh) --Cria PK composta
)

--Adicionando chaves estrangeiras

ALTER TABLE Permissao
	ADD 
	CONSTRAINT FK_Permissao_veiculo
		foreign key (placa) REFERENCES veiculo,
	CONSTRAINT FK_Permissao_Motorista
		foreign key (cnh) REFERENCES Motorista

-- Criando tabela com PK e FK

CREATE TABLE Permissao(
	placa VARCHAR(8) NOT NULL,
	cnh INT NOT NULL
	foreign key REFERENCES Motorista,
	PRIMARY KEY (placa, cnh) -- Cria PK C
)

DROP TABLE Permissao