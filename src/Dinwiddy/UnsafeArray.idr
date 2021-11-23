module Dinwiddy.UnsafeArray

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
