module Chs45 where

-- Problem 4.1
halve :: [a] -> ([a],[a])
halve xs = (take half xs, drop half xs)
    where 
        half = length xs `div`2

-- Problem 4.2 a with head and tail
third :: [a] -> a
third xs = head (tail(tail xs))

-- Problem 4.2 b with indexing !!
third' :: [a] -> a
third' xs = xs !! 2

-- Problem 4.2 c with pattern matching
third'' :: [a] -> a
third'' (x:y:z:xs) = z

-- Problem 5.2
grid :: Int -> Int -> [(Int,Int)]
grid x y = [(x , y) | x <- [0..x], y <- [0..y]]

-- Problem 5.3
square :: Int -> [(Int,Int)]
square n = [(x , y) | x <- [0..n], y <- [0..n], (y /= x)]

-- Problem 5.4
replicate' :: Int -> a -> [a]
replicate' i x = replicate i x
