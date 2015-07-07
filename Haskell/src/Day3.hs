module Day3 where

import qualified Data.Map as Map

nestedLookup :: Map.Map String (Map.Map String String) -> String -> String -> String
nestedLookup map key key2 =
    case Map.lookup key map of
      Just map2 -> case Map.lookup key2 map2 of
                     Just value -> value
                     Nothing -> ""
      Nothing -> ""