module Solutions.Originals (solveOriginal) where

import Lib (countDivisors, triangleNumbers)

solveOriginal :: Int -> Int
solveOriginal n = head $ filter ((> n) . countDivisors) triangleNumbers
