module Dinwiddy

import Data.Vect

||| A type-unsafe array based on List. Please don't use this unless you know what you're doing.
public export
UnsafeArray : (dimension : Nat) -> (type : Type) -> Type
UnsafeArray (S Z) t = List t
UnsafeArray (S k) t = List (UnsafeArray k t)
UnsafeArray Z     _ = ()

-- A type-safe array (based on Vect).
-- Example:
-- x : Array 3 _ Bool
public export
Array : (dimension : Nat) -> (dimensions : Vect dimension Nat) -> (type : Type) -> Type
Array (S Z) ds t = Vect (head ds) t
Array (S k) ds t = Vect (head ds) (Array k (tail ds) t)
Array Z     _  _ = ()

{-
  Hypothetical scenario: Array 3 [2, 3] Int.
  Should make type for the following array:
  ###
  ###
  So, we're given an (S k). That makes a vect of
-}

namespace Matrix
  -- TODO: Generic over only numeric types.
  ||| Generic unsafe 2D Matrix type.
  public export
  UnsafeMatrix2 : Type -> Type
  UnsafeMatrix2 = UnsafeArray 2

  public export
  Matrix2 : Vect 2 Nat -> Type -> Type
  Matrix2 = Array 2

{-
  Hypothetical scenario: Array 3 Int.

  The first time, it goes through `Array (S k)`. The LHS loops and the RHS brings List t.
  The loop brings us to the second time, which is again S k=2. The LHS loops again and the
  RHS brings List t. The third loop brings us to an end, as it is 1 (S Z). This brings List t.

  Hence, we get List t :: List t :: List t. But, we can use :: on types! Which is where I'm wrong.
  What am I actually looking for? I guess what I really want is List (List (List t)). How?

-}

{-
  DONE: Stronger Array type based off of Vect
  TODO: Helper functions for arrays (e.g. zeros)
  DONE: Matrix type synonym
  TODO: Matrix multiplication
-}
