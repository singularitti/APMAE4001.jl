"""
# module Substitution



# Examples

```jldoctest
julia>
```
"""
module Substitution

using LinearAlgebra: rank, UpperTriangular, LowerTriangular

using APMAE4001.Matrix: issquare

export Forward,
    Backward,
    substitution

struct Forward end
struct Backward end

"""
    substitution(::Backward, A::AbstractMatrix, b::AbstractVector)

[Forward and back substitution](https://en.wikipedia.org/wiki/Triangular_matrix#Forward_and_back_substitution) referenced from Wikipedia.
"""
function substitution(::Backward, A::AbstractMatrix, b::AbstractVector)
    issquare(A) || throw(DimensionMismatch("The matrix `A` is not a square matrix!"))
    m = size(A, 1)
    solutions = zeros(m)
    solutions[m] = b[m] / A[m, m]
    for i in (m - 1):-1:1
        solutions[i] = (b[i] - sum(A[i, j] * solutions[j] for j in (i + 1):m)) / A[i, i]
    end
    solutions
end
"""
    substitution(::Forward, A::AbstractMatrix, b::AbstractVector)

[Forward and back substitution](https://en.wikipedia.org/wiki/Triangular_matrix#Forward_and_back_substitution) referenced from Wikipedia.
"""
function substitution(::Forward, A::AbstractMatrix, b::AbstractVector)
    issquare(A) || throw(DimensionMismatch("The matrix `A` is not a square matrix!"))
    m = size(A, 1)
    solutions = zeros(m)
    solutions[1] = b[1] / A[1, 1]
    for i in 2:m
        solutions[i] = (b[i] - sum(A[i, j] * solutions[j] for j in 1:(i - 1))) / A[i, i]
    end
    solutions
end
"""
    substitution(A::UpperTriangular, b::AbstractVector)

A wrapper function, will use backward substitution algorithm.
"""
substitution(A::UpperTriangular, b::AbstractVector) = substitution(Backward(), A.data, b)
"""
    substitution(A::LowerTriangular, b::AbstractVector)

A wrapper function, will use forward substitution algorithm.
"""
substitution(A::LowerTriangular, b::AbstractVector) = substitution(Forward(), A.data, b)

end