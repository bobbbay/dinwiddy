module Dinwiddy

public export
Array : (dimension : Nat) -> (type : Type) -> Type
Array (S Z) t = List t
Array (S k) t = List (Array k t)
Array Z     _ = ()

namespace Matrix
  -- TODO: Generic over only numeric types.
  ||| Generic 2D Matrix type.
  public export
  Matrix2 : Type -> Type
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
  TODO: Stronger Array type based off of Vect
  TODO: Helper functions for arrays (e.g. zeros)
  DONE: Matrix type synonym
  TODO: Matrix multiplication
-}
