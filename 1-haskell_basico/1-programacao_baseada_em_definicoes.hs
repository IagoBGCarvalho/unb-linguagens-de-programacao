-- Para rodar um arquivo Haskell:
-- 1 - Abrir o terminal do VS Code
-- 2 - Digitar "ghci" para iniciar o ambiente interativo da linguagem
-- 3 - Digitar ":load nome_arquivo.sh" para carregar o código na memória
-- 4 - Caso o console retorne "Ok, one module loaded" a partir desse momento todas as funções do arquivo estarão na memória e podem ser invocadas pelos seus nomes
-- 5 - Basta digitar o nome da função seguida de seus parâmetros para retornar a sua saída (ex: quadrado 4)
-- 6 - Para sair do modo interativo e voltar para o terminal, basta digitar ":quit"

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

-- addD 2 (addD 3 4)
-- = 2 * (2 + (addD 3 4))
-- = 2 * (2 + 2 * (3 + 4))
-- = 32