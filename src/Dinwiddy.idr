module Dinwiddy

import Data.Vect

{-
  DONE: Stronger Array type based off of Vect
  TODO: Helper functions for arrays (e.g. zeros)
  DONE: Matrix type synonym
  TODO: Matrix multiplication
  TODO: Force Matrix values to have numeric types
-}

||| A type-unsafe array, based on List.
||| Example usage:
||| ```
||| x : UnsafeArray 2 Int
||| ```
||| Will create a type for 2-dimensional infinite arrays.
||| Please don't use this type, unless absolutely necessary,
||| because lengths are not indexed in the type. This type is
||| based off of Idris' Lists.
public export
UnsafeArray : (dimension : Nat) -> (type : Type) -> Type
UnsafeArray (S Z) t = List t
UnsafeArray (S k) t = List (UnsafeArray k t)
UnsafeArray Z     _ = ()

||| A type-safe array, based on Vect.
||| Example usage:
||| ```idris
||| x : Array 3 [5, 5, 6] Bool
||| ```
||| Will create a 3-dimensional Array with the size of 5x5x6.
|||
||| As another example,
||| ```
||| x : Array 2 [2, 3] Bool
||| ```
||| Will create an array that looks like this:
||| ```
||| ###
||| ###
||| ```
||| Full of booleans. It's value could be, for example:
||| x = [[ True,  True,  True ],
|||      [ False, False, True ]]
|||
||| This type has an advantage over `UnsafeArray`, because it's
||| indexed in the type like `Vect`s.
public export
Array : (dimension : Nat) -> (dimensions : Vect dimension Nat) -> (type : Type) -> Type
Array (S Z) ds t = Vect (head ds) t
Array (S k) ds t = Vect (head ds) (Array k (tail ds) t)
Array Z     _  _ = ()

namespace Matrix
  ||| Generic unsafe 2D Matrix type.
  public export
  UnsafeMatrix2 : Type -> Type
  UnsafeMatrix2 = UnsafeArray 2

  ||| Generic safe 2D Matrix type
  public export
  Matrix2 : Vect 2 Nat -> Type -> Type
  Matrix2 = Array 2
