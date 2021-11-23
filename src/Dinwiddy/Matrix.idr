module Dinwiddy.Matrix

import Dinwiddy.UnsafeArray
import Dinwiddy.Array

import Data.Vect

||| Generic unsafe 2D Matrix type.
public export
UnsafeMatrix2 : Type -> Type
UnsafeMatrix2 = UnsafeArray 2

||| Generic safe 2D Matrix type
public export
Matrix2 : Vect 2 Nat -> Type -> Type
Matrix2 = Array 2
