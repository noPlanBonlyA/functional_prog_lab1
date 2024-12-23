module Solutions
  ( solveTailRecursive,
    solveRecursive,
    solveWithFilter,
    solveWithInfiniteLists,
    countFirstSundays, -- Добавляем новую функцию в экспорт модуля
    countFirstSundaysRecursive,
    countFirstSundaysWithFold,
    countFirstSundaysWithMap,
  )
where

import Data.Time.Calendar (dayOfWeek, fromGregorian)
import Data.Time.Calendar.WeekDate
import Lib (countDivisors, triangleNumbers)

solveTailRecursive :: Int -> Int
solveTailRecursive n = go 1 1
  where
    go i tri
      | countDivisors tri > n = tri
      | otherwise = go (i + 1) (tri + i + 1)

solveRecursive :: Int -> Int
solveRecursive n = head [t | t <- triangleNumbers, countDivisors t > n]

solveWithFilter :: Int -> Int
solveWithFilter n = head $ filter ((> n) . countDivisors) triangleNumbers

solveWithInfiniteLists :: Int -> Int
solveWithInfiniteLists n = fst $ head $ dropWhile ((<= n) . snd) $ zip triangleNumbers (map countDivisors triangleNumbers)

countFirstSundays :: Int
countFirstSundays =
  length
    [ () | year <- [1901 .. 2000], month <- [1 .. 12], dayOfWeek (fromGregorian (toInteger year) month 1) == Sunday
    ]

countFirstSundaysRecursive :: Int -> Int -> Int
countFirstSundaysRecursive year count
  | year > 2000 = count
  | otherwise = countFirstSundaysRecursive (year + 1) (count + countSundaysInYear year)
  where
    countSundaysInYear y = length [m | m <- [1 .. 12], dayOfWeek (fromGregorian (toInteger y) m 1) == Sunday]

countFirstSundaysWithFold :: Int
countFirstSundaysWithFold = foldl (\acc year -> acc + countSundaysInYear year) 0 [1901 .. 2000]
  where
    countSundaysInYear y = length [m | m <- [1 .. 12], dayOfWeek (fromGregorian (toInteger y) m 1) == Sunday]

countFirstSundaysWithMap :: Int
countFirstSundaysWithMap = sum $ map countSundaysInYear [1901 .. 2000]
  where
    countSundaysInYear y = length [m | m <- [1 .. 12], dayOfWeek (fromGregorian (toInteger y) m 1) == Sunday]
