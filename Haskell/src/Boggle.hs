module Boggle where

import Data.Char
import Data.List.Split

type Coord = (Int, Int)
type Path = [Coord]
type Board = String
type Word = [Letter]
type Letter = Char

boardSide = 4

isInBoard :: Coord -> Bool
isInBoard (x,y) = x >= 0 && y >= 0 && x < boardSide && y < boardSide

getNeighbors :: Coord -> [Coord]
getNeighbors (x,y) = filter isInBoard [(x+1, y), (x-1, y), (x, y+1), (x, y-1)]

posToCoord :: Int -> Coord
posToCoord pos = (pos `div` 4, pos `mod` 4)

coordToIndex :: Coord -> Int
coordToIndex (x,y) = x + (y * boardSide)

letterAt :: Board -> Path -> Letter
letterAt board path = board !! (coordToIndex (head path))

findSubString :: Board -> Word -> Path -> Path
findSubString board word path
    | (head word)   /= letterAt board path = []             -- stop traversal if letter doesn't match
    | (length word) == 1                   = (-1,-1):path   -- base case for a match.  prepend (-1,-1) for splitting.
    | otherwise                            =                -- otherwise, continue with recursive traversal
        concat (map (\x -> findSubString board (tail word) (x:path)) validNeighbors)
    where validNeighbors = filter (\x -> not (x `elem` path)) (getNeighbors (head path))

findWord :: Board -> Word -> [Path]
findWord board word = solutions
    where startingCoords     = [(x,y) | x <- [0..(boardSide-1)], y <- [0..(boardSide-1)]]
          solutionsCombined  = map (\start -> findSubString board word [start]) startingCoords
          solutions          = filter (not . null) (concat (map (\x -> splitOn [(-1,-1)] x) solutionsCombined))

-- print(findWord "ABCDBOGGIKELNOPE" "BOGGLE")
