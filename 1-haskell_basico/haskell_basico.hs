import Control.Arrow (Arrow(first, second))
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
makeSpaces :: Int -> String
makeSpaces n | (n == 0) = ""
             | (n > 0)  = " " ++ makeSpaces(n - 1)

pushRight :: Int -> String -> String
pushRight n s = (makeSpaces n) ++ s

-- Float e Double
-- 22.3435 :: Float
-- +,-,*,/ :: Float -> Float -> Float
-- pi :: Float
-- ceiling, floor, round :: Float -> Int
-- fromIntegral :: Int -> Float

-- Tuplas
-- intP :: (Int, Int)
-- intP = (33,43)
-- (True, ’x’) :: (Bool, Char)
-- (34, 22,’b’) :: (Int, Int, Char)
-- addPair :: (Int,Int) -> Int
-- addPair (x,y) = x+y
-- shift :: ((Int,Int),Int) -> (Int,(Int,Int))
-- shift ((x,y),z) = (x,(y,z))

-- Tipos
type Name = String
type Age = Int
type Phone = Int
type Person = (Name, Age, Phone)
name :: Person -> Name
name (n,a,p) = n

-- Definições locais
-- Estilo bottom-up ou top-down
-- sumSquares :: Int -> Int -> Int
-- sumSquares x y = sqX + sqY
--     where sqX = x * x 
--     sqY = y * y

-- sumSquares x y = sq x + sq y
--     where sq z = z * z

-- sumSquares x y = let sqX = x * x
--     sqY = y * y
--     in sqX + sqY

-- Notação
-- f n + 1 (funções tem mais precedência do que a soma)
-- f (n + 1) (função aplicada ao resultado da soma)
-- 2 + 3 
-- (+) 2 3 (operador prefixado, primeiro vem a operação e depois os argumentos)
-- maxi 2 4
-- 2 ‘maxi‘ 4