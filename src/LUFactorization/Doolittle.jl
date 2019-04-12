"""
# module Doolittle



# Examples

```jldoctest
julia>
```
"""
module Doolittle

using LinearAlgebra: I, kron

export doolittle_lu

function _row_vector(n::Int, k::Int)
    v = zeros(n)
    v[k] = one(eltype(v))
    return v
end

"""
    _elimination_factors(n::Int, k::Int, A::AbstractMatrix)

Generate a vector of factors to eliminate the $k$th column.
Combine this function with `_row_vector` to to generate an general elementary elimination matrix.
"""
function _elimination_factors(n::Int, k::Int, A::AbstractMatrix)
    v = zeros(promote_type(eltype(A), Float64), n)
    for j in (k + 1):n
        v[j] = A[j, k] / A[k, k]  # elimination factor
    end
    v
end

"""
    _general_elementary_elimination_matrix(lk::AbstractVector, ek::AbstractVector)

Elimination matrix $E_k$ do row operations to eliminate the $k$th column.
"""
_general_elementary_elimination_matrix(lk::AbstractVector, ek::AbstractVector) = I - kron(lk, transpose(ek))  # `I` is the identity matrix.

"""
    doolittle_lu(A::AbstractMatrix; include_l::Bool=true, include_e::Bool=false)

Referenced from [Wikipedia "LU decomposition" page](https://en.wikipedia.org/wiki/LU_decomposition#Doolittle_algorithm).
"""
function doolittle_lu(A::AbstractMatrix; include_l::Bool = true, include_e::Bool = false)
    m, n = size(A)
    m == n || throw(DimensionMismatch("The $m by $n matrix `a` is not a square matrix!"))

    intermediate_elementary_elimination_matrices = []
    for k in 1:(n - 1)
        Ek = _general_elementary_elimination_matrix(_elimination_factors(n, k, A), _row_vector(n, k))
        pushfirst!(intermediate_elementary_elimination_matrices, Ek)  # Keep this order!
        A = Ek * A
    end
    # Now `A` is the U matrix.
    E = prod(*, intermediate_elementary_elimination_matrices)
    include_e && return E, A
    include_l && return inv(E), A  # L matrix is `inv(E)`.
    return A
end

end