module HigherOrder where

--split into n-size lists and return as list. Return Nothing if not possible
-- split 3 [1..9] -> Just [ [1,2,3],[4,5,6],[7,8,8] ]
-- split 4 [1..9] -> Nothing
-- Maybe is in the Prelude and described in Chapter 8.
-- do this any way you like

--splitH :: [a] -> [a] -> [a]

splitH :: Int -> [a] -> [[a]]
splitH _ [] = []
splitH n xs
  | n > 0 = (take n xs) : (splitH n (drop n xs))
  | otherwise = error ""

split :: Int -> [a] -> Maybe [[a]]
split _ [] = Just ([])
split n xs = if ((length xs) `mod` n) == 0 then Just (splitH n xs) else Nothing

splitH1 :: Int -> [a] -> [[a]]
splitH1 _ [] = []
splitH1 n xs
  | n > 0 = (take n xs) : (splitH1 n (drop n xs))
  | otherwise = error ""

split1 :: Int -> [a] -> [[a]]
split1 _ [] = []
split1 n xs = if ((length xs) `mod` n) == 0 then (splitH1 n xs) else []

allTheSame :: (Eq a) => [a] -> Bool
allTheSame [] = False
allTheSame xs = and $ map (== head xs) (tail xs)

isRepeats :: Eq a => Int -> [a] -> Bool 
isRepeats n xs =  allTheSame(splitH1 n xs)

--map/filter: As above
isRepeats' :: Eq a => Int -> [a] -> Bool 
isRepeats' n xs = allTheSame(splitH1 n xs)

--foldr:as above
isRepeats'' :: Eq a => Int -> [a] -> Bool 
isRepeats'' n xs = allTheSame(splitH1 n xs) 


--returns the longest sequence s.t. xs is the concatenation of 
-- two  or more repeats  of the sequence (not one... obviously)
-- returns Nothing if such a sequence does not exist
-- repreats "fred" -> Nothing
-- repeats "fredfred" -> Just "fred"
-- repeats [1,2,1,2,1,2,1,2] -> Just [1,2,1,2]
repeats :: Eq a => [a] -> Maybe [a]
repeats xs = Nothing