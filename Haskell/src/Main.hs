module Main where

import Day1
import Day2

main = do
    print((sort_list' (<=) [1,5,2,6,3,7]))
    print((sort_list' (>=) [1,5,2,6,3,7]))
    print((divide_by_half 4))
    print((take 5 (every_eighth 0 0)))
    print((append_new_line "blah"))
    print((find_gcd 16 8))