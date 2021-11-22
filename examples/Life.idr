module Life

import Dinwiddy

import Data.Vect

||| A type for the size of the board.
BoardSize : Vect 2 Nat
BoardSize = [10, 10]

||| A basic board type: a 2D array of 10x10.
Board : Type
Board = Array 2 BoardSize Int

step : board -> board
step = ?idk

-- Given some 2D array and a point, calculate the # of surrounding living blocks.
-- How do we deal with overflows? Maybe by having a Point type that must be valid?
-- Or, we can return a Maybe and default to 0.
step' : Board -> Int -> Int -> Int

-- One way we can achieve this is by providing a special point type with margins.
-- The type should gaurantee during compile time that the margins exists.
-- Imaginably, very useful for board games and such.
stepPrimeWithPointType : Board -> (?PointWithMargins 1 1 1 1) -> Int

export
life : IO ()
life = putStrLn "Generated game of life!"
