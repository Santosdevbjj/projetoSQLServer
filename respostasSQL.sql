USE [Filmes];
GO

-- 1 - Buscar o nome e ano dos filmes.
SELECT
    Nome,
    Ano
FROM
    Filmes;

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano.
SELECT
    Nome,
    Ano
FROM
    Filmes
ORDER BY
    Ano ASC;

-- 3 - Buscar pelo filme 'De Volta para o Futuro', trazendo o nome, ano e a duração.
SELECT
    Nome,
    Ano,
    Duracao
FROM
    Filmes
WHERE
    Nome = 'De Volta para o Futuro';

-- 4 - Buscar os filmes lançados em 1997.
SELECT
    Nome,
    Ano,
    Duracao
FROM
    Filmes
WHERE
    Ano = 1997;

-- 5 - Buscar os filmes lançados APÓS o ano 2000.
SELECT
    Nome,
    Ano,
    Duracao
FROM
    Filmes
WHERE
    Ano > 2000;

-- 6 - Buscar os filmes com a duração maior que 100 e menor que 150, ordenando pela duração em ordem crescente.
SELECT
    Nome,
    Ano,
    Duracao
FROM
    Filmes
WHERE
    Duracao > 100 AND Duracao < 150
ORDER BY
    Duracao ASC;

-- 7 - Buscar a quantidade de filmes lançados no ano, agrupando por ano, ordenando pela duração em ordem decrescente.
-- Nota: A pergunta pede para ordenar pela duração em ordem decrescente, mas está agrupando por ano.
-- Presumo que a intenção era ordenar a contagem de filmes por ano em ordem decrescente de filmes por ano,
-- ou a soma das durações por ano. Se for apenas ordenar os anos, será pela contagem.
-- Se a intenção é ordenar os ANOS pela QUANTIDADE de filmes em ordem decrescente, a consulta é como segue.
SELECT
    Ano,
    COUNT(Id) AS QuantidadeFilmes
FROM
    Filmes
GROUP BY
    Ano
ORDER BY
    QuantidadeFilmes DESC;

-- Se a intenção fosse ordenar pelo ano em si, seria ORDER BY Ano DESC.
-- Se a intenção fosse a soma das durações por ano e ordenar por isso:
-- SELECT Ano, SUM(Duracao) AS SomaDuracao FROM Filmes GROUP BY Ano ORDER BY SomaDuracao DESC;


-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome.
SELECT
    PrimeiroNome,
    UltimoNome
FROM
    Atores
WHERE
    Genero = 'M';

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome.
SELECT
    PrimeiroNome,
    UltimoNome
FROM
    Atores
WHERE
    Genero = 'F'
ORDER BY
    PrimeiroNome ASC;

-- 10 - Buscar o nome do filme e o gênero.
SELECT
    F.Nome AS NomeFilme,
    G.Genero
FROM
    Filmes AS F
INNER JOIN
    FilmesGenero AS FG ON F.Id = FG.IdFilme
INNER JOIN
    Generos AS G ON FG.IdGenero = G.Id;

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério".
SELECT
    F.Nome AS NomeFilme,
    G.Genero
FROM
    Filmes AS F
INNER JOIN
    FilmesGenero AS FG ON F.Id = FG.IdFilme
INNER JOIN
    Generos AS G ON FG.IdGenero = G.Id
WHERE
    G.Genero = 'Mistério';

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel.
SELECT
    F.Nome AS NomeFilme,
    A.PrimeiroNome,
    A.UltimoNome,
    EF.Papel
FROM
    Filmes AS F
INNER JOIN
    ElencoFilme AS EF ON F.Id = EF.IdFilme
INNER JOIN
    Atores AS A ON EF.IdAtor = A.Id;
 
