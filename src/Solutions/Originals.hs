module Solutions.Originals (solveOriginal) where

import Lib (triangleNumbers, countDivisors)

solveOriginal :: Int -> Int
solveOriginal n = head $ filter ((> n) . countDivisors) triangleNumbers