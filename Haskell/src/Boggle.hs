module Boggle where

import Data.Char

type Coord = (Int, Int)
type Path = [Coord]
type Board = [Char]
type Word = [Char]

boardSide = 4

isInBoard :: Coord -> Bool
isInBoard (x,y) = x >= 0 && y >= 0 && x < boardSide && y < boardSide

getNeighbors :: Coord -> [Coord]
getNeighbors (x,y) = filter isInBoard [(x+1, y), (x-1, y), (x, y+1), (x, y-1)]

posToCoord :: Int -> Coord
posToCoord pos = (pos `div` 4, pos `mod` 4)

coordToIndex :: Coord -> Int
coordToIndex (x,y) = x + (y * boardSide)

findSubString :: Board -> Word -> Path -> Path
findSubString board word path
    | (head word)   /= (board !! (coordToIndex (head path))) = []     -- stop traversal if letter doesn't match
    | (length word) == 1                                     = path   -- base case for a match
    | otherwise                                              =        -- otherwise, continue with recursive traversal
        concat (map (\x -> findSubString board (tail word) (x:path)) validNeighbors)
    where validNeighbors = filter (\x -> not (x `elem` path)) (getNeighbors (head path))

findWord :: Board -> Word -> [Path]
findWord board word = [concat solutions]
    where startingCoords = [(x,y) | x <- [0..(boardSide-1)], y <- [0..(boardSide-1)]]
          solutions      = map (\start -> findSubString board word [start]) startingCoords

-- print(findWord "ABCDEOGGIKELNOPE" "BOGGLE")