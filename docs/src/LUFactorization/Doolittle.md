# Doolittle algorithm

```@meta
CurrentModule = APMAE4001.LUFactorization.Doolittle
```

We are solving a linear equation

```math
\mathrm{ A } \mathbf{ x } = \mathbf{ b },
```

where ``\mathrm{ A }`` is an ``n \times n`` matrix. Turn it into an equivalent form

```math
\mathrm{ U } \mathbf{ x } = \mathbf{ c },
```

where ``\mathrm{ U }`` is an upper triangular matrix.

For the ``k``th step, we have an elimination matrix ``\mathrm{ E }_k``, so

```math
\mathrm{ U } = \mathrm{ E }_{n - 1} \cdots \mathrm{ E_2 E_1 } \mathrm{ A } \equiv \mathrm{ E A },
```

where ``\mathrm{ E } = \mathrm{ E }_{n - 1} \cdots \mathrm{ E_2 E_1 }``. Thus we have ``n - 1`` steps in total. We denote here

```math
\mathrm{ A }_{k} = \mathrm{ E }_k \mathrm{ A }_{k - 1}.
```

Thus the final step will be ``\mathrm{ A }_{n - 1} = \mathrm{ E }_{n - 1} \mathrm{ A }_{n - 2} = \mathrm{ U }``.

So

```math
\mathrm{ A } = \mathrm{ E }^{-1} \mathrm{ U } = (\mathrm{ E }_{n - 1} \cdots \mathrm{ E_2 E_1 })^{-1} \mathrm{ U } = \mathrm{ E }^{-1}_1 \mathrm{ E }^{-1}_2 \cdots \mathrm{ E }^{-1}_{n - 1} \mathrm{ U } = \mathrm{ L }_1 \mathrm{ L }_2 \cdots \mathrm{ L }_{n - 1} \mathrm{ U } \equiv \mathrm{ L } \mathrm{ U },
```

where ``\mathrm{ L } = \mathrm{ L }_1 \mathrm{ L }_2 \cdots \mathrm{ L }_{n - 1}``.

```@docs
elimination_factors(n::Int, k::Int, A::AbstractMatrix)

general_elementary_elimination_matrix(lk::AbstractVector, ek::AbstractVector)

doolittle_lu(A::AbstractMatrix; include_l::Bool=true, include_e::Bool=false)
```
