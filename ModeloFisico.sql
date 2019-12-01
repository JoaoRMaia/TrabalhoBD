CREATE DATABASE Trab;
USE Trab;

CREATE TABLE Senador (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Partido VARCHAR(20),
    UF CHAR(2),
    Titularidade VARCHAR(100),
    Mandato VARCHAR(20),
    DtNasc CHAR(10),
    Email VARCHAR(100),
    fk_Placa CHAR(7)
);

CREATE TABLE Beneficio (
    Valor NUMERIC(10,2),
    Tipo VARCHAR(30),
    Descricao VARCHAR(500),
    Id INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Carro_Executivo (
    Placa CHAR(7) PRIMARY KEY,
    Modelo VARCHAR(30),
    Vinculo VARCHAR(10),
    TipoCombustivel VARCHAR(100),
    KmRodados INT,
    LitrosGastos NUMERIC(5,2),
    Condutor VARCHAR(100)
);

CREATE TABLE EscritorioApoio (
    Setor VARCHAR(200) PRIMARY KEY,
    Endereco VARCHAR(200),
    Telefone VARCHAR(15),
    Fax VARCHAR(15),
    Estado CHAR(2),
    fk_Sen_ID INT
);

CREATE TABLE Sen_Telefone (
	Sen INT,
    Telefone VARCHAR(15),
    PRIMARY KEY (Sen,Telefone)
);

CREATE TABLE Localizacao (
    Localizacao_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Endereco VARCHAR(200),
    Complemento VARCHAR(200)
);

CREATE TABLE Recebe (
    fk_Sen_ID INT,
    fk_Beneficio_Id INT
);

CREATE TABLE Gabinete (
    Chefe_de_Gabinete VARCHAR(100),
    fk_Localizacao INT,
    Descricao VARCHAR(200),
    Sen_ID INT,
    PRIMARY KEY (Chefe_de_Gabinete, Sen_ID)
);

CREATE TABLE CEAPS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Documento VARCHAR(40),
    Mes INT,
    Tipo_Despesa VARCHAR(200),
    CNPJ_CPF VARCHAR(20),
    Fornecedor VARCHAR(200),
    Data char(10),
    Ano INT,
    Detalhamento VARCHAR(1000),
    Reembolso NUMERIC(10,2),
    Sen_ID INT
);
 
ALTER TABLE Gabinete ADD CONSTRAINT FK_Gabinete_2
    FOREIGN KEY (fk_Localizacao)
    REFERENCES Localizacao (Localizacao_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Sen_Telefone ADD CONSTRAINT FK_Senador_3
    FOREIGN KEY (Sen)
    REFERENCES Senador (ID);
 
ALTER TABLE Senador ADD CONSTRAINT FK_Senador_4
    FOREIGN KEY (fk_Placa)
    REFERENCES Carro_Executivo (Placa)
    ON DELETE CASCADE;
 
ALTER TABLE EscritorioApoio ADD CONSTRAINT FK_EscritorioApoio_2
    FOREIGN KEY (fk_Sen_ID)
    REFERENCES Senador (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Recebe ADD CONSTRAINT FK_Recebe_1
    FOREIGN KEY (fk_Sen_ID)
    REFERENCES Senador (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Recebe ADD CONSTRAINT FK_Recebe_2
    FOREIGN KEY (fk_Beneficio_Id)
    REFERENCES Beneficio (Id)
    ON DELETE SET NULL;
 
ALTER TABLE Gabinete ADD CONSTRAINT FK_Gabinete_3
    FOREIGN KEY (Sen_ID)
    REFERENCES Senador (ID);
 
ALTER TABLE CEAPS ADD CONSTRAINT FK_CEAPS_2
    FOREIGN KEY (Sen_ID)
    REFERENCES Senador (ID);
