/* ModeloLogico: */

CREATE TABLE Senador (
    Nome varchar(100) PRIMARY KEY,
    Partido varchar(20),
    UF char(2),
    Titularidade varchar(100),
    Mandato DATE,
    fk_Telefone_Telefone_PK INT,
    DtNasc DATE,
    Email varchar(100),
    fk_Carro_Executivo_Placa char(7)
);

CREATE TABLE Beneficio (
    Valor numeric(10,2),
    Tipo varchar(30),
    Descricao varchar(30),
    Id INT PRIMARY KEY,
    fk_Carro_Executivo_Placa char(7),
    Gasto numeric(10,2)
);

CREATE TABLE Carro_Executivo (
    Placa char(7) PRIMARY KEY,
    Modelo varchar(30),
    Vinculo varchar(30),
    TipoCombustivel varchar(100),
    KmRodados numeric(5,2),
    LitrosGastos numeric(5,2),
    Condutor varchar(100)
);

CREATE TABLE EscritorioApoio (
    Setor varchar(200) PRIMARY KEY,
    Endereco varchar(200),
    Telefone varchar(15),
    Fax varchar(15),
    Estado char(2),
    fk_Gabinete_Senador_Nome varchar(100)
);

CREATE TABLE Telefone (
    Telefone_PK INT NOT NULL PRIMARY KEY,
    Telefone varchar(15)
);

CREATE TABLE Localizacao (
    Localizacao_PK INT NOT NULL PRIMARY KEY,
    Endereco VARCHAR(200),
    Complemento VARCHAR(200)
);

CREATE TABLE Recebe (
    fk_Gabinete_Senador_Nome varchar(100),
    fk_Beneficio_Id INT
);

CREATE TABLE Gabinete (
    Chefe de Gabinete varchar(100),
    fk_Localizacao varchar(20),
    Descricao VARCHAR(200),
    Senador varchar(100),
    PRIMARY KEY (Chefe de Gabinete, Senador)
);

CREATE TABLE CEAPS (
    Documento VARCHAR(40) PRIMARY KEY,
    Mes INT,
    Tipo_Despesa VARCHAR(200),
    CNPJ_CPF VARCHAR(,
    Fornecedor VARCHAR(200),
    Data DATE,
    Ano INT,
    Detalhamento VARCHAR(200),
    Reembolso numeric(10,2),
    fk_Senador varchar(100)
);
 
ALTER TABLE Senador ADD CONSTRAINT FK_Senador_2
    FOREIGN KEY (fk_Localizacao_Localizacao_PK)
    REFERENCES Localizacao (Localizacao_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Senador ADD CONSTRAINT FK_Senador_3
    FOREIGN KEY (fk_Telefone_Telefone_PK)
    REFERENCES Telefone (Telefone_PK);
 
ALTER TABLE Senador ADD CONSTRAINT FK_Senador_4
    FOREIGN KEY (fk_Carro_Executivo_Placa)
    REFERENCES Carro_Executivo (Placa)
    ON DELETE CASCADE;
 
ALTER TABLE Beneficio ADD CONSTRAINT FK_Beneficio_2
    FOREIGN KEY (fk_Carro_Executivo_Placa)
    REFERENCES Carro_Executivo (Placa)
    ON DELETE CASCADE;
 
ALTER TABLE EscritorioApoio ADD CONSTRAINT FK_EscritorioApoio_2
    FOREIGN KEY (fk_Gabinete_Senador_Nome)
    REFERENCES Senador (Nome)
    ON DELETE CASCADE;
 
ALTER TABLE Recebe ADD CONSTRAINT FK_Recebe_1
    FOREIGN KEY (fk_Gabinete_Senador_Nome)
    REFERENCES Senador (Nome)
    ON DELETE SET NULL;
 
ALTER TABLE Recebe ADD CONSTRAINT FK_Recebe_2
    FOREIGN KEY (fk_Beneficio_Id)
    REFERENCES Beneficio (Id)
    ON DELETE SET NULL;
 
ALTER TABLE Gabinete ADD CONSTRAINT FK_Gabinete_2
    FOREIGN KEY (Senador)
    REFERENCES Senador (Nome);
 
ALTER TABLE CEAPS ADD CONSTRAINT FK_CEAPS_2
    FOREIGN KEY (fk_Senador)
    REFERENCES Senador (Nome);
