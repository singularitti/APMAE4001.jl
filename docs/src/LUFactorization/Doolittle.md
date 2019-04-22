# Doolittle

```@meta
CurrentModule = PMAE4001.LUFactorization.Doolittle
```

```@docs
elimination_factors(n::Int, k::Int, A::AbstractMatrix)

general_elementary_elimination_matrix(lk::AbstractVector, ek::AbstractVector)

doolittle_lu(A::AbstractMatrix; include_l::Bool=true, include_e::Bool=false)
```
