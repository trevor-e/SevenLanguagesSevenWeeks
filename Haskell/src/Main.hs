module Main where

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

main = do
    print ([1,2,3])
    print (reverse_list [1,2,3])
    build_colors
    build_multiplication_table