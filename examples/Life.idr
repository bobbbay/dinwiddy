module Life

-- This example is a work in progress, as Dinwiddy evolves :).

import Dinwiddy

import Data.Vect
import Data.Fin

||| A type for the size of the board.
BoardSize : Vect 2 Nat
BoardSize = [10, 10]

||| A basic board type: a 2D array of 10x10.
Board : Type
Board = Array 2 BoardSize Bool

mutual
  ||| Given a board, apply another step onto it, effectively looping over every
  ||| point and calculating its status.
  step : Board -> Board

  ||| Same as `step`, but does the bulk looping process.
  step' : Vect n (Vect m Bool) -> Vect n (Vect m Bool)

  isAlive : (Fin n, Fin m) -> Vect n (Vect m Bool) -> Bool
  isAlive _ _ = True

  ||| Given a location and a board, calculate the # of surrounding living blocks.
  neighbours : (Fin 10, Fin 10) -> Board -> Nat

example : Board
example = [[True, True, True, True, True, True, True, True, True, True],
           [True, True, True, True, True, True, True, True, True, True],
           [True, True, True, True, True, True, True, True, True, True],
           [True, True, True, True, True, True, True, True, True, True],
           [True, True, True, True, True, True, True, True, True, True],
           [True, True, True, True, True, True, True, True, True, True],
           [True, True, True, True, True, True, True, True, True, True],
           [True, True, True, True, True, True, True, True, True, True],
           [True, True, True, True, True, True, True, True, True, True],
           [True, True, True, True, True, True, True, True, True, True]]

export
life : IO ()
life = do putStrLn $ show example
          putStrLn $ show $ step example
          putStrLn "Generated game of life!"
