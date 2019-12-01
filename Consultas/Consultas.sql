--  1	consulta envolvendo	apenas	as	operações	de	seleção	e	projeção
create user 'joao'@'localhost' identified by '123';
use Trab;
grant all on * to 'joao';

SELECT * 
FROM EscritorioApoio 
WHERE Estado = 'RJ';  -- Escritorios de Apoio localizados no RJ

-- 2 consultas	envolvendo	a	junção	de	apenas	duas	relações,	sendo	que	uma	deve conter	junção	externa;

SELECT Senador.Nome, KmRodados 
FROM Senador 
LEFT JOIN Carro_Executivo ON Senador.fk_Placa = Carro_Executivo.Placa 
ORDER BY KmRodados DESC ; -- Senadores que mais usaram o carro executivo.

SELECT Senador.Nome, COUNT(Sen_Telefone.Sen) 
FROM Senador INNER JOIN Sen_Telefone ON Senador.ID = Sen_Telefone.Sen 
GROUP BY Senador.Nome HAVING COUNT(Sen_Telefone.Sen) < 2; -- Senadores que possuem apenas 1 telefone para contato 

-- 2 consultas	envolvendo	a	junção	de	três	ou	mais	relações;

SELECT Nome, Partido, UF, Valor 
FROM Senador 
INNER JOIN Recebe ON Recebe.fk_Sen_ID = Senador.ID 
INNER JOIN Beneficio ON Recebe.fk_Beneficio_Id = Beneficio.ID 
WHERE Tipo = "Auxilio-Combustivel" ORDER BY Valor DESC;  -- Quanto cada senador recebeu de Auxílio-Combustível

SELECT Partido, Sum(Valor)
FROM Senador 
INNER JOIN Recebe ON Recebe.fk_Sen_ID = Senador.ID 
INNER JOIN Beneficio ON Recebe.fk_Beneficio_Id = Beneficio.ID
Group By Partido;

-- 1 consulta envolvendo uma das operações sobre conjuntos (união, diferença ou intersecção);

SELECT Partido, SUM(Reembolso)
FROM CEAPS 
INNER JOIN Senador ON Senador.ID = CEAPS.Sen_ID
WHERE Senador.ID IN 
	(
	SELECT ID FROM Senador WHERE Partido = 'PT'
    UNION
    SELECT ID FROM Senador WHERE Partido = 'PSL'
    UNION
    SELECT ID FROM Senador WHERE Partido = 'PSDB'
    )
GROUP BY Partido;


-- 3 consultas	envolvendo	funções	de	agregação;
SELECT Fornecedor, SUM(Reembolso) 
FROM CEAPS 
INNER JOIN Senador ON Sen_ID=Senador.ID 
GROUP BY Fornecedor ; -- Quanto cada fornecedor recebeu

SELECT Senador.Nome, SUM(Reembolso) 
FROM CEAPS INNER JOIN Senador ON Senador.ID = Sen_ID 
GROUP BY Sen_ID ORDER BY SUM(Reembolso) DESC; -- Senadores que mais receberam em CEAPS

SELECT COUNT(Reembolso),AVG(Reembolso), Nome
FROM CEAPS 
INNER JOIN Senador On Sen_ID = Senador.ID 
GROUP BY Sen_ID ORDER BY COUNT(Reembolso) DESC; -- Senadores que mais tiveram CEAPS e o valor Médio delas

SELECT SUM(Valor) AS Total
FROM Beneficio
WHERE Tipo = "Auxilio-Combustivel";


--  1 consulta	envolvendo	subconsultas	aninhadas.

SELECT Nome, Partido, UF 
From Senador 
WHERE Senador.ID NOT IN ( 
	SELECT fk_Sen_ID 
    FROM Recebe 
    WHERE fk_Beneficio_Id = 77 OR fk_Beneficio_Id = 78); -- Senadores que abdicaram do Auxilio-Moradia