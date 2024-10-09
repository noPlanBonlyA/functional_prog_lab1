module Main (main) where

import Solutions

main :: IO ()
main = do
    let n = 500
    putStrLn $ "Решение с хвостовой рекурсией: " ++ show (solveTailRecursive n)
    putStrLn $ "Рекурсивное решение: " ++ show (solveRecursive n)
    putStrLn $ "Решение с использованием filter: " ++ show (solveWithFilter n)
    
    -- Добавляем вывод результата функции countFirstSundays
    putStrLn $ "Количество первых воскресений месяца с 1901 по 2000 год: " ++ show countFirstSundays
