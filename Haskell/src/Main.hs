module Main where

import Day1
import Day2
import Day3
import Boggle
import Data.List.Split
import Data.Map as Map

main = do
    print(findWord "ABCDBOGGIKELNOPE" "BOGGLE")
    let m = Map.fromList [("test1", "A value!")]
    let m2 = Map.fromList [("test2", m)]
    print(nestedLookup m2 "test2" "test1")
    print(nestedLookup m2 "test2" "badKey")
