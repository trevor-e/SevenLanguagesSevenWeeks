module Day2 where

-- takes a predicate for 2 elements,
-- takes a list of elements,
-- returns a sorted list
sort_list' :: (a -> a -> Bool) -> [a] -> [a]
sort_list' pred [] = []
sort_list' pred [x] = [x]
sort_list' pred (x:xs) = sort_insert pred x (sort_list' pred xs)

-- takes a predicate for 2 elements,
-- takes the current element being compared,
-- takes the current sorted list,
-- returns the newly sorted list
sort_insert :: (a -> a -> Bool) -> a -> [a] -> [a]
sort_insert _ _ [] = []
sort_insert pred x (y:ys)
    | pred x y = (x:y:ys)
    | otherwise = y:(sort_insert pred x ys)

divide x y = x/y
divide_by_half = flip divide 2

append_new_line x = x ++ "\n"

myRange :: (Num a) => a -> a -> [a]
myRange start step = start:(myRange (start + step) step)

every_third :: (Num a) => a -> [a]
every_third x = myRange x 3

every_fifth :: (Num a) => a -> [a]
every_fifth y = myRange y 5

every_eighth :: (Num a) => a -> a -> [a]
every_eighth x y = zipWith (+) (every_third (x+y)) (every_fifth (x+y))

find_gcd :: (Integral x) => x -> x -> x
find_gcd x 0 = x
find_gcd x y = gcd y (x `mod` y)