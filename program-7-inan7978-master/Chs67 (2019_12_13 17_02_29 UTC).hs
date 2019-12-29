module Chs67 where

    -- 6.2, 6.4, 6.9 sum/take/last, 7.4 dec2int, 7.9 altmap, and 7.10 luhn 


--don't delete the import, obviously
--remember to include function types (3 points each)

sumdown 0 = 0
sumdown n = n + sumdown (n-1)

euclid x y | x == y = x
           | x < y = euclid x (y-x)
           | y < x = euclid (x-y) y

           
sum' :: (Num a) => [a] -> a          
sum' [] = 0
sum' (x:xs) = x + sum' xs

take' :: Int -> [a] -> [a]
take' 0 _= []
take' n [] = []
take' n (x:xs) = x : take' (n-1) xs 

last' :: [a] -> a
last' [x] = x
last' (x:xs) = last' xs

dec2int' :: [Int] -> Int
dec2int' xs = sum [y * z | (y, z) <- zip values (reverse xs)]
                where values = iterate (*10) 1
               
altmap _ _ [] = []
altmap f s (x:xs) = (f x) : (altmap s f xs)

--define your own function(s) to help with luhn

helper :: Int -> Int
helper n
     | n*2 < 9 = n*2
     | otherwise = (n*2 - 9)

helper2 :: Int -> Int -> Int -> Int -> Bool
helper2 a b c d
     | mod (helper a + b + helper c + d) 10 == 0 = True
     |otherwise = False


luhn :: [Int] -> Bool
luhn ns | mod ((sum . altmap id helper . reverse) ns) 10 == 0 = True
        | otherwise = False