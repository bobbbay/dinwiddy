module Dinwiddy.Array

import Data.Vect

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
