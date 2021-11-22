module Dinwiddy

import Data.Vect

public export
data NDArray : (d : Nat) -> Type -> Type where
  Absurd : (t : Type) -> NDArray 0 t
  UnequalArray : (d : Nat) -> (t : Type) -> NDArray d t

zeros : NDArray 1 Int
zeros = UnequalArray 1 Int
