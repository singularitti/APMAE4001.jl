# Forward and back substitution

```@meta
CurrentModule = APMAE4001.LUFactorization.Substitution
```

```@docs
substitution(::Backward, A::AbstractMatrix, b::AbstractVector)
substitution(::Forward, A::AbstractMatrix, b::AbstractVector)
substitution(A::UpperTriangular, b::AbstractVector)
substitution(A::LowerTriangular, b::AbstractVector)
```