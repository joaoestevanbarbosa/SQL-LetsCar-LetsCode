CREATE DATABASE LETS_CAR24

CREATE TABLE Usuario
(
	EndElet VARCHAR(128) PRIMARY KEY,
	NomePessoa VARCHAR(100) NOT NULL
)

CREATE TABLE Cor
(
	IdCor INT IDENTITY PRIMARY KEY,
	NomeCor VARCHAR(45) NOT NULL,
)

CREATE TABLE Adicional
(
	IdAdicional INT IDENTITY PRIMARY KEY,
	Vidro VARCHAR(3),
	Trava VARCHAR(3),
	Ar VARCHAR(3),
	Outros VARCHAR (45)
)

CREATE TABLE Marca
(
	IdMarca INT IDENTITY PRIMARY KEY,
	NomeMarca VARCHAR(50) NOT NULL,
)

CREATE TABLE Modelo
(
	IdModelo INT IDENTITY PRIMARY KEY,
	NomeModelo VARCHAR(45) NOT NULL,
	IdMarca INT CONSTRAINT FK_Modelo_Marca FOREIGN KEY (IdMarca) REFERENCES Marca(IdMarca),
	Ano INT NOT NULL
)

CREATE TABLE Carro
(
	IdCarro INT IDENTITY PRIMARY KEY,
	IdModelo INT NOT NULL, --CONSTRAINT FK_Carro_Modelo FOREIGN KEY (IdModelo) REFERENCES Modelo(IdModelo),
	IdCor INT NOT NULL, --CONSTRAINT FK_Carro_Cor FOREIGN KEY (IdCor) REFERENCES Cor(IdCor)
	IdFormulario INT, --CONSTRAINT FK_Carro_Formulario FOREIGN KEY (IdFormulario) REFERENCES Formulario(IdFormulario),
	IdFavorito INT, --CONSTRAINT FK_Carro_Favorito FOREIGN KEY (IdFavorito) REFERENCES Favorito(IdFavorito),
	IdPagamento INT, --CONSTRAINT FK_Carro_Pagamento FOREIGN KEY (IdPagamento) REFERENCES Pagamento(IdPagamento)
)

CREATE TABLE Pagamento
(
	IdPagamento INT IDENTITY PRIMARY KEY,
	IdAdicional INT CONSTRAINT FK_Pagamento_Adicional FOREIGN KEY (IdAdicional) REFERENCES Adicional(IdAdicional),
	IdCarro INT NOT NULL CONSTRAINT FK_Pagamento_Carro FOREIGN KEY (IdCarro) REFERENCES Carro(IdCarro),
	FormaDePagamento VARCHAR(50) NOT NULL
)

CREATE TABLE Cliente
(
	IdCliente INT IDENTITY PRIMARY KEY,
	CPF INT NOT NULL,
	NomeCliente VARCHAR(45) NOT NULL,
	IdPagamento INT CONSTRAINT FK_Cliente_Pagamento FOREIGN KEY (IdPagamento) REFERENCES Pagamento(IdPagamento)
)

CREATE TABLE Formulario
(
	IdFormulario INT IDENTITY PRIMARY KEY,
	IdCarro INT NOT NULL CONSTRAINT FK_Formulario_Carro FOREIGN KEY (IdCarro) REFERENCES Carro(IdCarro),
	EndElet VARCHAR(128) NOT NULL CONSTRAINT FK_Formulario_Usuario FOREIGN KEY (EndElet) REFERENCES Usuario(EndElet)
)

CREATE TABLE Favorito
(
	IdFavorito INT IDENTITY PRIMARY KEY,
	IdCarro INT NOT NULL CONSTRAINT FK_Favorito_Carro FOREIGN KEY (IdCarro) REFERENCES Carro(IdCarro),
	EndElet VARCHAR(128) NOT NULL CONSTRAINT FK_Favorito_Usuario FOREIGN KEY (EndElet) REFERENCES Usuario(EndElet),
)

ALTER TABLE Carro ADD CONSTRAINT FK_Carro_Modelo FOREIGN KEY (IdModelo) REFERENCES Modelo(IdModelo)

ALTER TABLE	Carro ADD CONSTRAINT FK_Carro_Cor FOREIGN KEY (IdCor) REFERENCES Cor(IdCor)

ALTER TABLE	Carro ADD CONSTRAINT FK_Carro_Formulario FOREIGN KEY (IdFormulario) REFERENCES Formulario(IdFormulario)

ALTER TABLE	Carro ADD CONSTRAINT FK_Carro_Favorito FOREIGN KEY (IdFavorito) REFERENCES Favorito(IdFavorito)

ALTER TABLE	Carro ADD CONSTRAINT FK_Carro_Pagamento FOREIGN KEY (IdPagamento) REFERENCES Pagamento(IdPagamento)
