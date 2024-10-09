module Lib
    ( triangleNumbers
    , countDivisors
    ) where

triangleNumbers :: [Int]
triangleNumbers = scanl (+) 0 [1..]

countDivisors :: Int -> Int
countDivisors n = ((*2) . length . filter (\d -> n `mod` d == 0)) [1..floor $ sqrt $ fromIntegral n]
