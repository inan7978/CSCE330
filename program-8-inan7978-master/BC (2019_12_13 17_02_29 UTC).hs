module BC where
--import Data.Char


--indexInto returns the index of the first argument in a list 
--(don't worry about error checking -- can assume in list)
indexInto :: Eq a => a -> [a] -> Int
indexInto x (y:ys) = if x == head (y:ys) 
                     then 0 
                     else 1 + indexInto x (tail (y:ys))

--converts a character into its corresponding integer value
-- e.g. '0' to 0, 'A' to 10, 'Z' to 35 
-- like hex, except with more digits
-- (consider using elem -- look it up)
dig2Int :: Char -> Int
dig2Int dChar = indexInto dChar "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

--converts an integer in range 0..35 into its 
-- corresponding digit (0,1..Z)
-- again, don't care about ints out of bounds
num2char :: Int -> Char
num2char n = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" !! n


--converts an integer value to a string representing
-- the number in base b

int2Helper n b | n == 0 = ""
               | otherwise = num2char(mod n b) :
               int2Helper (div n b) b
int2Base :: Int -> Int -> String
int2Base n b = reverse (int2Helper n b)

--convert a number string in base b1 into an Int

valNumString :: String -> Int -> Int
valNumString xs b = sum (map (\ (c,p) -> (dig2Int c)* (b^p)) cps)
    where
        cps = zip (reverse xs) [0..]

--convert String of numbers in base b1 into 
-- equivalent value in base b2, as a String
-- again
convert :: String -> Int -> Int -> String
convert numString b1 b2 = int2Base (valNumString numString b1) b2