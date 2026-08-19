-- Para rodar um arquivo Haskell:
-- 1 - Abrir o terminal do VS Code
-- 2 - Digitar "ghci" para iniciar o ambiente interativo da linguagem
-- 3 - Digitar ":load nome_arquivo.sh" para carregar o código na memória
-- 4 - Caso o console retorne "Ok, one module loaded" a partir desse momento todas as funções do arquivo estarão na memória e podem ser invocadas pelos seus nomes
-- 5 - Basta digitar o nome da função seguida de seus parâmetros para retornar a sua saída (ex: quadrado 4)
-- 6 - Para carregar alterações feitas após o interpretador ser aberto, basta digitar ":r"
-- 7 - Para sair do modo interativo e voltar para o terminal, basta digitar ":quit"

-- Definindo constantes
resposta :: Int
resposta = 42

maior :: Bool
maior = (resposta > 71)

sim :: Bool
sim = True

-- Definindo funções
quadrado :: Int -> Int
quadrado x = x * x -- Função quadrática

tudoIgual :: Int -> Int -> Int -> Bool
tudoIgual n m p = (n == m) && (m == p)

-- Caso a equação boleana seja satisfeita, a linha será executada, se não, desce para a próxima
maxi :: Int -> Int -> Int
maxi n m | n >= m    = n 
         | otherwise = m

addD :: Int -> Int -> Int
addD a b = 2 * (a+b)

-- Como o Haskell resolve os problemas (lazy valuation):
-- addD 2 (addD 3 4)
-- = 2 * (2 + (addD 3 4))
-- = 2 * (2 + 2 * (3 + 4))
-- = 32

-- Tipos básicos

-- Inteiros:
-- 1, 2, 3, ... :: Int
-- +, *, -, div, mod :: Int -> Int -> Int
-- >, >=, ==, /=, <=, < :: Int -> Int -> Bool
-- Int: Tamanho fixo por implementação (8/16 bytes)
-- Integer: Tamanho arbitrário

-- Booleanos:
-- True, False :: Bool -> Bool
-- &&, || :: Bool -> Bool -> Bool
-- not :: Bool -> Bool

-- Recursão: 
-- Definir caso base
-- Definir o valor para fun n usando o valor de fun n-1 (passo recursivo)

-- Casamento de padrões:
-- Permite usar padrões no lugar de variáveis na definição de funções, permitindo implementar comportamentos diferentes de função para padrões diferentes.
-- A avaliação de padrões sempre é feita de cima para baixo na execução do código, assim como a guarda
-- Exemplo:
maxSales :: Int -> Int
maxSales 0 = 0 -- O padrão é 0, ou sejam quando o argumento for 0, o comportamento será retornar 0
maxSales n = maxi n 5 -- "n" é o padrão que será ativado quando qualquer argumento inteiro for utilizado, onde o compotamento da função será outro (verificar se o inteiro é maior do 5 e retornar o maior valor)

-- Outros exemplo:
myOr :: Bool -> Bool -> Bool
myOr True  x = True
myOr False x = x

myAnd :: Bool -> Bool -> Bool
myAnd False x = False
myAnd True  x = x

-- Exercícios:
-- makeSpaces :: Int -> String
-- makeSpaces n | (n == 0) = ""
--              | (n > 0)  = chr n 