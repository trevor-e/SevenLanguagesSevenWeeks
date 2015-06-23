module Day1 where

reverse_list [] = []
reverse_list [x] = [x]
reverse_list list = last list : reverse_list (init list)

build_colors = do
    let colors = ["black", "white", "blue", "yellow", "red"]
    let combos = [(a,b) | a <- colors, b <- colors]
    print (combos)

build_multiplication_table = do
    let values = [1..12]
    let table = [(a,b,a*b) | a <- values, b <- values]
    print (table)