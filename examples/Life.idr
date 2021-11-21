module Life

import Dinwiddy

step : Matrix2 Int -> Matrix2 Int
step ?somethingHere = / Sum surrounding pieces and decide what to do accordingly /

-- Given some 2D array and a point, calculate the # of surrounding living blocks.
-- How do we deal with overflows? Maybe by having a Point type that must be valid?
-- Or, we can return a Maybe and default to 0.
step' : NDArray -> Int -> Int -> Int
step' world x y = -- Handle Justs and Nones

-- One way we can achieve this is by providing a special point type with margins.
-- The type should gaurantee during compile time that the margins exists.
-- Imaginably, very useful for board games and such.
stepPrimeWithPointType : NDArray -> (PointWithMargins 1 1 1 1) -> Int
stepPrimeWithPointType world point = world[x-1][y] + world[x+1][y] + world[x][y-1] + world[x][y+1]

export
life : IO ()
life = putStrLn "Generated game of life!"
