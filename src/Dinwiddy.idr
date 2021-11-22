module Dinwiddy

import Data.Vect

public export
data NDArray : (d : Nat) -> Type -> Type where
  Absurd : (t : Type) -> NDArray 0 t
  UnequalArray : (d : Nat) -> (t : Type) -> NDArray d t

zeros : NDArray 1 Int
zeros = UnequalArray 1 Int

-- Dimension -> Array type
mkArr : Type -> Type
mkArr t = List t

-- Dimension -> Array type
Array : Nat -> Type -> Type
Array (S Z) t = List t
Array (S k) t = List (Array k t)
Array Z     _ = ()

{-
  Hypothetical scenario: Array 3 Int.

  The first time, it goes through `Array (S k)`. The LHS loops and the RHS brings List t.
  The loop brings us to the second time, which is again S k=2. The LHS loops again and the
  RHS brings List t. The third loop brings us to an end, as it is 1 (S Z). This brings List t.

  Hence, we get List t :: List t :: List t. But, we can use :: on types! Which is where I'm wrong.
  What am I actually looking for? I guess what I really want is List (List (List t)). How?

-}
