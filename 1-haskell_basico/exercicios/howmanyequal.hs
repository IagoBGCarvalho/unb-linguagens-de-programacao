allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n == m) && (m == p)

howManyEqual :: Int -> Int -> Int -> Int
howManyEqual a b c | allEqual a b c = 3
                   | (a == b) || (b == c) || (a == c) = 2
                   | otherwise = 0
