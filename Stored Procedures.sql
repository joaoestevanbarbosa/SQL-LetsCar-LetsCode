CREATE PROCEDURE MarcaInsert
(
	@NomeMarca VARCHAR(50)
)
AS
BEGIN
	INSERT INTO Marca (NomeMarca)
	VALUES (@NomeMarca)
END

CREATE PROCEDURE MarcaUpdate
(
	@IdMarca INT,
	@NomeMarca VARCHAR(50)
)
AS
BEGIN
	UPDATE Marca
		SET NomeMarca = @NomeMarca
		WHERE IdMarca = @IdMarca
END

CREATE PROCEDURE MarcaSelect
AS
BEGIN
	SELECT * FROM Marca
END

CREATE PROCEDURE MarcaDelete
(
	@IdMarca INT
)
AS
BEGIN
	DELETE FROM Marca
	WHERE IdMarca = @IdMarca
END

CREATE PROCEDURE CorInsert
(	
	@NomeCor VARCHAR(45)
)
AS
BEGIN
	INSERT INTO Cor(NomeCor)
	VALUES (@NomeCor)
END

CREATE PROCEDURE CorUpdate
(
	@IdCor INT,
	@NomeCor VARCHAR(45)
)
AS
BEGIN
	UPDATE Cor
		SET NomeCor = @NomeCor
		WHERE IdCor = @IdCor
END

CREATE PROCEDURE CorSelect
AS
BEGIN
	SELECT * FROM Cor
END

CREATE PROCEDURE CorDelete
(
	@IdCor INT
)
AS
BEGIN
	DELETE FROM Cor
	WHERE IdCor = @IdCor
END

CREATE PROCEDURE ClienteInsert --criar idpagamento como null
(	
	@CPF INT,
	@NomeCliente VARCHAR(45),
	@IdPagamento INT
)
AS
BEGIN
	INSERT INTO Cliente (CPF, NomeCliente, IdPagamento)
	VALUES (@CPF, @NomeCliente, @IdPagamento)
END

CREATE PROCEDURE ClienteUpdate --pra fazer update do IdPagamento, precisa ter Pagamento criado
(
	@CPF INT,
	@NomeCliente VARCHAR(45),
	@IdPagamento INT,
	@IdCliente INT
)
AS
BEGIN
	UPDATE Cliente
		SET CPF = @CPF,
			NomeCliente = @NomeCliente,
			IdPagamento = @IdPagamento
		WHERE IdCliente = @IdCliente
END


CREATE PROCEDURE ClienteSelect
AS
BEGIN
	SELECT * FROM CLIENTE
END

CREATE PROCEDURE ClienteDelete
(
	@IdCliente INT
)
AS
BEGIN
	DELETE FROM Cliente
	WHERE IdCliente = @IdCliente
END


CREATE PROCEDURE ModeloInsert --criar idmarca como null
(
	@NomeModelo VARCHAR(45),
	@IdMarca INT,
	@Ano INT
)
AS
BEGIN
	INSERT INTO Modelo (NomeModelo, IdMarca, Ano)
	VALUES (@NomeModelo, @IdMarca, @Ano)
END

CREATE PROCEDURE ModeloUpdate --pra fazer update do modelo, a IdMarca precisa tá criada em Marca
(
	@NomeModelo VARCHAR(45),
	@IdMarca INT,
	@Ano INT,
	@IdModelo INT
)
AS 
BEGIN
	UPDATE Modelo
		SET NomeModelo = @NomeModelo,
			IdMarca = @IdMarca,
			Ano = @Ano
		WHERE IdModelo = @IdModelo
END

CREATE PROCEDURE ModeloDelete
(
	@IdModelo INT
)
AS
BEGIN
	DELETE FROM Modelo
	WHERE IdModelo = @IdModelo
END

CREATE PROCEDURE ModeloSelect
AS 
BEGIN
	SELECT * FROM Modelo
END

CREATE PROCEDURE AdicionalInsert
(
	@Vidro VARCHAR(3),
	@Trava VARCHAR(3),
	@Ar VARCHAR(3),
	@Outros VARCHAR(3)
)
AS 
BEGIN
	INSERT INTO Adicional(Vidro, Trava, Ar, Outros)
	VALUES (@Vidro, @Trava, @Ar, @Outros)
END

CREATE PROCEDURE AdicionalUpdate
(
	@Vidro VARCHAR(3),
	@Trava VARCHAR(3),
	@Ar VARCHAR(3),
	@Outros VARCHAR(3),
	@IdAdicional INT
)
AS
BEGIN
	UPDATE Adicional
	SET Vidro = @Vidro,
			Trava = @Trava,
			Ar = @Ar,
			Outros = @Outros
		WHERE IdAdicional = @IdAdicional
END

CREATE PROCEDURE AdicionalDelete
(
	@IdAdicional INT
)
AS
BEGIN
	DELETE FROM Adicional
	WHERE IdAdicional = @IdAdicional
END

CREATE PROCEDURE AdicionalSelect
AS 
BEGIN
	SELECT * FROM Adicional
END

CREATE PROCEDURE PagamentoInsert --precisa do carro criado
(
	@IdAdicional INT,
	@IdCarro INT,
	@FormaDePagamento VARCHAR(50)
)
AS
BEGIN
	INSERT INTO Pagamento(IdAdicional,IdCarro,FormaDePagamento)
	VALUES (@IdAdicional,@IdCarro,@FormaDePagamento)
END

CREATE PROCEDURE PagamentoUpdate --precisa do carro criado
(
	@IdAdicional INT,
	@IdCarro INT,
	@FormaDePagamento VARCHAR(50),
	@IdPagamento INT
)
AS
BEGIN
	UPDATE Pagamento
	SET IdAdicional = @IdAdicional,
			IdCarro = @IdCarro,
			FormaDePagamento = @FormaDePagamento
		WHERE IdPagamento = IdPagamento
END

CREATE PROCEDURE PagamentoDelete --precisa do carro criado
(
	@IdPagamento INT
)
AS
BEGIN
	DELETE FROM Pagamento
	WHERE IdPagamento = @IdPagamento
END

CREATE PROCEDURE PagamentoSelect
AS 
BEGIN
	SELECT * FROM Pagamento
END

CREATE PROCEDURE CarroInsert --precisa do Modelo e Cor criados
(
	@IdModelo INT,
	@IdCor INT,
	@IdFormulário INT,
	@IdFavorito INT,
	@IdPagamento INT
)
AS
BEGIN
	INSERT INTO Carro(IdCor, IdFormulario, IdFavorito, IdPagamento)
	VALUES (@IdCor, @IdFormulário, @IdFavorito, @IdPagamento)
END

CREATE PROCEDURE CarroUpdate --precisa do Modelo e Cor criados
(
	@IdCarro INT,
	@IdModelo INT,
	@IdCor INT,
	@IdFormulário INT,
	@IdFavorito INT,
	@IdPagamento INT
)
AS
BEGIN
	UPDATE Carro
	SET IdModelo = @IdModelo,
			IdCor = @IdCor,
			IdFormulario = @IdFormulário,
			IdFavorito = @IdFavorito,
			IdPagamento = @IdPagamento	
		WHERE IdCarro = @IdCarro
END

CREATE PROCEDURE CarroDelete
(
	@IdCarro INT
)
AS
BEGIN
	DELETE FROM Carro
	WHERE IdCarro = @IdCarro
END

CREATE PROCEDURE CarroSelect
AS 
BEGIN
	SELECT * FROM Carro
END

CREATE PROCEDURE FormularioInsert --precisa do usuario e carro criados
(
	@IdCarro INT,
	@EndElet INT
)
AS
BEGIN
	INSERT INTO Formulario(IdCarro, EndElet)
	VALUES (@IdCarro, @EndElet)
END

CREATE PROCEDURE FormularioUpdate --precisa do usuario e carro criados
(
	@IdCarro INT,
	@EndElet INT,
	@IdFormulario INT
)
AS
BEGIN
	UPDATE Formulario
	SET IdCarro = @IdCarro,
			EndElet = @EndElet
		WHERE IdFormulario = @IdFormulario
END

CREATE PROCEDURE FormularioDelete
(
	@IdFormulario INT
)
AS
BEGIN
	DELETE FROM Formulario
	WHERE IdFormulario = @IdFormulario
END

CREATE PROCEDURE FormularioSelect
AS
BEGIN
	SELECT * FROM Formulario
END

CREATE PROCEDURE FavoritoInsert --precisa do usuario e carro criados
(
	@IdCarro INT,
	@EndElet INT
)
AS
BEGIN
	INSERT INTO Favorito(IdCarro, EndElet)
	VALUES (@IdCarro, @EndElet)
END

CREATE PROCEDURE FavoritoUpdate --precisa do usuario e carro criados
(
	@IdCarro INT,
	@EndElet INT,
	@IdFavorito INT
)
AS
BEGIN
	UPDATE Favorito
	SET IdCarro = @IdCarro,
			EndElet = @EndElet
		WHERE IdFavorito = @IdFavorito
END

CREATE PROCEDURE FavoritoSelect
AS
BEGIN
	SELECT * FROM Favorito
END

CREATE PROCEDURE FavoritoDelete
(
	@IdFavorito INT
)
AS
BEGIN
	DELETE FROM Favorito
	WHERE IdFavorito = @IdFavorito
END

CREATE PROCEDURE UsuarioInsert
(
	@EndElet VARCHAR(128),
	@NomePessoa VARCHAR (100)
)
AS
BEGIN
	INSERT INTO Usuario (EndElet, NomePessoa)
	VALUES (@EndElet, @NomePessoa)
END

CREATE PROCEDURE UsuarioUpdate
(
	@EndElet VARCHAR(128),
	@NomePessoa VARCHAR (100)
)
AS
BEGIN
	UPDATE Usuario
	SET EndElet = @EndElet,
			NomePessoa = @NomePessoa
END

CREATE PROCEDURE UsuarioSelect
AS
BEGIN
	SELECT * FROM Usuario
END

CREATE PROCEDURE UsuarioDelete
(
	@EndElet VARCHAR(128)
)
AS
BEGIN
	DELETE FROM Usuario
	WHERE EndElet = @EndElet
END

CREATE PROCEDURE FormularioEnviado --PRECISA CRIAR USUARIO, FORMULARIO E CARRO 
(
	@IdFormulario INT
)
AS
BEGIN
SELECT Usuario.EndElet as Usuario,
		Formulario.IdFormulario as Formulario,
		Carro.IdCarro as Carro
		FROM Usuario INNER JOIN Formulario on Usuario.EndElet = Formulario.EndElet
					INNER JOIN Carro on Formulario.IdCarro = Carro.IdCarro
		WHERE Formulario.IdFormulario = @IdFormulario
END


CREATE PROCEDURE FavoritoMarcado --PRECISA CRIAR USUARIO, FAVORITO E CARRO
(
	@IdFavorito INT
)
AS
BEGIN
SELECT Usuario.EndElet as Usuario,
		Favorito.IdFavorito as Favorito,
		Carro.IdCarro as Carro
		FROM Usuario INNER JOIN Favorito on Usuario.EndElet = Favorito.EndElet
					INNER JOIN Carro on Favorito.IdCarro = Carro.IdCarro
		WHERE Favorito.IdFavorito = @IdFavorito
END


CREATE PROCEDURE PagamentoProcurar --PRECISA CRIAR NO MÍNIMO CLIENTE E CARRO, ADICIONAL É EXTRA
(
	@IdPagamento INT
)
AS
BEGIN
SELECT Cliente.NomeCliente as Cliente,
		Pagamento.IdPagamento as [No. do Contrato],
		Pagamento.FormaDePagamento as Pagamento,
		Carro.IdCarro as Carro
		FROM Cliente INNER JOIN Pagamento on Cliente.IdPagamento = Pagamento.IdPagamento
					INNER JOIN Carro on Pagamento.IdCarro = Carro.IdCarro
		WHERE Pagamento.IdPagamento = @IdPagamento
END