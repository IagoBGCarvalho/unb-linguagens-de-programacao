fatorial :: Int -> Int
fatorial n | (n == 0) = 1
           | otherwise = n * fatorial(n - 1)

fatorial' :: Int -> Int
fatorial' n | (n == 0) = 1
            | (n > 0)  = n * fatorial'(n - 1) -- apesar de dar erro para números negativos (assim como a função anterior) ainda é um erro menos pior, pois não consome toda a memória e dá um stack overflow como a anterior