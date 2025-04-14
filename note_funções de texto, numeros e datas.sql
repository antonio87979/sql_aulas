-- funções de texto, numeros e datas

-- tras a quantidade de caracteres
SELECT LENGTH('quantidade de caracteres');
-- tras a quantidade de caracteres em uma coluna
SELECT LENGTH('caracteres apelido') AS nome;

-- seleciona em maiusculo
SELECT UPPER('Maiúscula') AS campo_maiusculo;
-- seleciona em minusculo
SELECT LOWER('MINÚSCULA') AS campo_minusculo;

-- junta duas palavras
SELECT CONCAT('Juntando',' as ', 'Palavras')AS tudo_junto;

-- trsa uma quantidade especifica de caracteres
SELECT SUBSTRING('Hello Kitty', 1, 5) 
as texto_hellokitty;

-- retira os espaços do começo e fim
SELECT TRIM(' Nome com Espaços ') as sem_espaco;

-- arredonda para maior ou menor as casas decimais
SELECT ROUND(132.454, 2) as arrendondamento;

-- arredonda para o número inteiro mais proximo
SELECT CEIL(132.001) as arrendondamento_cima;

-- arredonda para baixo, mantem apenas o numero inteiro
SELECT FLOOR(132.999) as arrendondamento_baixo;

-- impar ou par
SELECT 5 % 2 as resto_divisao;
SELECT MOD(5, 2) as resto_divisao_funcao;

-- tras a data
SELECT current_date as data_atual;

-- tras a hora
SELECT current_time as hora_atual;

-- tras a data e a hora
SELECT current_timestamp as data_hora_atual;
SELECT NOW() as data_hora_atual;

-- adiciona intervalo de tempo futuros
SELECT DATE_ADD(now(), interval 1 day) as amanha;
SELECT DATE_ADD(now(), interval 1 month) as mes_que_vem;
SELECT DATE_ADD(now(), interval 1 year) as ano_que_vem;

-- adiciona intervalo de tempo passados
SELECT DATE_SUB(now(), interval 1 day) as ontem;
SELECT DATE_SUB(now(), interval 1 month) as mes_passado;
SELECT DATE_SUB(now(), interval 1 year) as ano_passado;

-- diferença de dias
SELECT DATEDIFF(now(), '2025-03-07') as diferenca_dias; 
SELECT DATEDIFF(DATE_ADD(now(), interval 1 year), '2025-03-07') 
as diferenca_dias;

