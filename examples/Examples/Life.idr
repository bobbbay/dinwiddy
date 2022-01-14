module Examples.Life

import Dinwiddy

import Data.Vect
import Data.Fin
  
||| Width of the board.
W : Nat
W = 10

||| Height of the board.
H : Nat
H = 10

||| The size of the board.
BoardSize : Vect 2 Nat
BoardSize = [W, H]

||| A basic board type: a 2D array of Bools, with the size of BoardSize.
||| A square is dead if it is False, and alive if it is True.
Board : Type
Board = Array 2 BoardSize Bool

mutual
  ||| Given a board, apply another step onto it, effectively looping over every
  ||| point and calculating its status.
  step : Board -> Board
  step b = b

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
