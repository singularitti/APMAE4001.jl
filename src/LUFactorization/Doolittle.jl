"""
# module Doolittle



# Examples

```jldoctest
julia>
```
"""
module Doolittle

using LinearAlgebra: I, kron, UpperTriangular

using APMAE4001.Matrix: issquare
using APMAE4001.LUFactorization.Substitution

export doolittle_lu,
    linearsolve

function row_vector(n::Int, k::Int)
    v = zeros(n)
    v[k] = one(eltype(v))
    return v
end

"""
    elimination_factors(n::Int, k::Int, A::AbstractMatrix)

Generate a vector of factors to eliminate the `k`th column.
Combine this function with `row_vector` to to generate an general elementary elimination matrix.

# Arguments
- `n::Integer`: the size of the matrix `A`.
- `k::Integer`: the step count in the elimination process. It must satisfies `1 ≤ k ≤ n - 1`.
- `A::AbstractMatrix`: the matrix from `(k - 1)`th step of the elimination process.
"""
function elimination_factors(n::Int, k::Int, A::AbstractMatrix)
    v = zeros(promote_type(eltype(A), Float64), n)
    for j in (k + 1):n
        v[j] = A[j, k] / A[k, k]  # elimination factor
    end
    v
end

"""
    general_elementary_elimination_matrix(lk::AbstractVector, ek::AbstractVector)

Elimination matrix ``E_{k}`` do row operations to eliminate the `k`th column.
"""
general_elementary_elimination_matrix(lk::AbstractVector, ek::AbstractVector) = I - kron(lk, transpose(ek))  # `I` is the identity matrix.

"""
    doolittle_lu(A::AbstractMatrix; include_l::Bool=true, include_e::Bool=false)

Referenced from [Wikipedia "LU decomposition" page](https://en.wikipedia.org/wiki/LU_decomposition#Doolittle_algorithm).
"""
function doolittle_lu(A::AbstractMatrix; include_l::Bool = true, include_e::Bool = false)
    issquare(A) || throw(DimensionMismatch("The matrix `A` is not a square matrix!"))
    n = size(A, 1)

    intermediate_elementary_elimination_matrices = []
    for k in 1:(n - 1)
        Ek = general_elementary_elimination_matrix(elimination_factors(n, k, A), row_vector(n, k))
        pushfirst!(intermediate_elementary_elimination_matrices, Ek)  # Keep this order!
        A = Ek * A
    end
    # Now `A` is the U matrix.
    E = prod(*, intermediate_elementary_elimination_matrices)
    include_e && return E, A
    include_l && return inv(E), A  # L matrix is `inv(E)`.
    return A
end

function linearsolve(A::AbstractMatrix, b::AbstractVector)
    E, U = doolittle_lu(A, include_e = true)
    substitution(UpperTriangular(U), E * b)
end

end