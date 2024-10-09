module Solutions
    ( solveTailRecursive
    , solveRecursive
    , solveWithFilter
    , solveWithInfiniteLists
    , countFirstSundays  -- Добавляем новую функцию в экспорт модуля
    ) where
import Lib (triangleNumbers, countDivisors)
import Data.Time.Calendar (fromGregorian, dayOfWeek)
import Data.Time.Calendar.WeekDate

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
countFirstSundays = length
    [ () | year <- [1901..2000]
         , month <- [1..12]
         , dayOfWeek (fromGregorian (toInteger year) month 1) == Sunday
    ]
