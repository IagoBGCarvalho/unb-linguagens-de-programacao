-- Funções de alta ordem:
-- Funções como argumentos ou como resultado de outras funções.

-- Permite definições polimórficas (funções aplicadas sobre uma coleção de tipos)

-- Nas funções a seguir, a única coisa diferente é a operação aplicada aos elementos da lista:
double :: [Int] -> [Int]
double [] = []
double (a:x) = (2*a) : double x

sqrList :: [Int] -> [Int]
sqrList [] = []
sqrList (a:x) = (a*a) : sqrList x

-- Map é o padrão que se aplica a cima. no caso, iterar sobre cada elemento de um conjunto aplicando uma determinada operação

-- Recebe como argumentos:
-- * transformação a ser aplicada a cada elemento da lista (função)
-- * a lista

map' :: (t -> u) -> [t] -> [u]
map' f [] = []
map' f (a:as) = f a : map' f as
map' f l = [f a | a <- l] -- Outra definição!

-- Utilização:
-- doubleList xs = map' times2 xs
-- sqrList    xs = map' sqr xs

-- Folding 
sumList :: [Int] -> Int
sumList [] = 0
sumList (a:as) = a + sumList as
sumList l = fold' (+) l

fold' :: (t -> t -> t) -> [t] -> t
fold' f [a] = a
fold' f (a:as) = f a (fold' f as)
