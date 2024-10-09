module Main (main) where

import Solutions

main :: IO ()
main = do
    let n = 500
    putStrLn $ "Решение с хвостовой рекурсией: " ++ show (solveTailRecursive n)
    putStrLn $ "Рекурсивное решение: " ++ show (solveRecursive n)
    putStrLn $ "Решение с использованием filter: " ++ show (solveWithFilter n)
    
    putStrLn $ "Количество первых воскресений месяца с 1901 по 2000 год:"
    putStrLn $ "  - Исходное решение: " ++ show countFirstSundays
    putStrLn $ "  - Рекурсивное решение: " ++ show (countFirstSundaysRecursive 1901 0)
    putStrLn $ "  - Решение с использованием fold: " ++ show countFirstSundaysWithFold
    putStrLn $ "  - Решение с использованием map: " ++ show countFirstSundaysWithMap
