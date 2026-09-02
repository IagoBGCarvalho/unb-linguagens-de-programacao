import Control.Arrow (Arrow(first, second))
-- Listas são estruturas de dados que guardam uma sequência de valores de um mesmo tipo

-- [] é uma lista de qualquer tipo

--Exemplos:
-- [1,2,3,4] :: [Int]
-- [True] :: [Bool]
-- [(5,True),(7,True)] :: [(Int,Bool)]
-- [[4,2],[3,7,7,1],[],[9]] :: [[Int]]
-- ['b','o','m'] :: [Char]
-- "bom" :: [Char]

-- Listas são diferentes de Conjuntos, pois a ordem dos elementos é significante
-- [1, 2] /= [2, 1]
-- O número de elementos também importa:
-- [True,True] /= [True]

-- Construtor de listas (:)

-- [5] é o mesmo que 5:[]
-- [4, 5] é o mesmo que 4:(5:[])
-- [2,3,4,5] é o mesmo que 2:3:4:5:[]

-- (:) é um construtor polimórfico:
-- (:) :: Int -> [Int] -> [Int]
-- (:) :: Bool -> [Bool] -> [Bool]
-- (:) :: t -> [t] -> [t]

-- [1,2] ++ [3] -> [1,2,3]

-- Notações simplificadas:

-- [2..7] = [2,3,4,5,6,7]
-- [-1..3] = [-1,0,1,2,3]
-- 2.8..5.0] = [2.8,3.8,4.8]
-- [7,5..0] = [7,5,3,1]
-- [2.8,3.3..5.0] = [2.8,3.3,3.8,4.3,4.8] 

-- O Haskell infere o padrão da progessão aritmética com base nos dois primeiros elementos.
-- A regra é que o último elemento deve ser maior do que os elementos inferidos anteriormente
-- Se ele não conseguir inferir a progressão, retorna uma lista vazia "[]"

-- Funções sobre listas

-- Problema: somar os elementos de uma lista
sumList :: [Int] -> Int
sumList [] = 0 -- Caso Base
sumList (a:as) = a + sumList as -- Caso recursivo: lista tem cabeça e cauda

-- Para avaliar a expressão, é necessário:

-- Substituir os parâmetros pelos argumentos na expressão.
-- Rescrevendo a chamada da função pelo corpo da função substituindo o parâmetro pelo valor atrelado a ele pelo binding.

-- Ou seja, na chamada função sumList [2,3,4,5]:
-- a -> 2
-- as -> [3,4,5]

-- O que desenrola, recursivamente, em:

-- = 2 + sumList [3,4,5]
-- = 2 + (3 + sumList [4,5])
-- = 2 + (3 + (4 + sumList [5]))
-- = 2 + (3 + (4 + (5 + sumList [])))
-- = 2 + (3 + (4 + (5 + 0)))
-- = 14

-- Dobrar os elementos de uma lista
double :: [Int] -> [Int]
double [] = []
double (n:ns) = 2 * n : double ns

-- double :: [Int] -> [Int]
-- double [] = []
-- double (n:ns) = n : n : double ns

-- Checar se um elemento está na lista:

member :: [Int] -> Int -> Bool
member [] _ = False -- _ = qualquer coisa
member (x:xs) e = (x == e) || member xs e

-- Soma de uma lista de pares
sumPairs :: [(Int,Int)] -> [Int]
sumPairs [] = []
-- sumPairs (a:as) = ((first a) + (second a)) : sumPairs as

zip' :: [t] -> [u] -> [(t,u)]
zip' (a:as) (b:bs) = (a,b):zip' as bs
zip' [] [] = []

-- zip ["Maria", "Jose"] [20, 21] -> [("Maria",20),("Jose,21")]

-- Avaliação da função:

-- É necessário trocar repetir o corpo da função trocando os parâmetros pelos argumentos.
-- Primeiro o compilador irá fazer isso:
-- a = "Maria"
-- as = ["Jose"]
-- b = 20
-- bs = 21

-- Depois irá repetir o corpo da função e fazer a troca:

-- (a,b):zip as bs
-- ("Maria", 20):zip ["Jose"] [21]
-- E depois:
-- ("Maria", 20) ("Jose", 21)

last' :: [t] -> t
last' [a] = a -- Quando a lista tiver apenas 1 elemento, o caso base será acionado e retornará o elemento em si
last' (a:b:abs) = last'(b:abs) -- Passo recursivo

-- Definição de tipos

type Person = String
type Book = String
type Database = [(Person, Book)]

-- Exemplo de banco de dados:

exampleBase =
    [("Alice","Postman Pat"),
    ("Anna","All Alone"),
    ("Alice","Spot"),
    ("Rory","Postman Pat")]

-- Funções sobre o banco de dados

-- Retorna uma lista com os livros de uma pessoa
books :: Database -> Person -> [Book]
books [] _ = []
books ((p,b):pbs) per | p == per = b:books pbs per
                      | otherwise = books pbs per
books db per = [l | (p,l) <- db, p == per] -- outra forma de fazer o que está acima

-- Retorna as pessoas que pegaram um mesmo livrso
borrowers :: Database -> Book -> [Person]
borrowers [] _ = []
borrowers ((p,b):pbs) per | p == per = p:borrowers pbs per


