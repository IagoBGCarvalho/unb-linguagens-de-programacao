allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n == m) && (m == p)

all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal a b c d = (a == b) && (b == c) && (c == d)

all4Equal2 :: Int -> Int -> Int -> Int -> Bool
all4Equal2 a b c d = allEqual a b c && (c == d)