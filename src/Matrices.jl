"""
# module Matrices



# Examples

```jldoctest
julia>
```
"""
module Matrices

using LinearAlgebra: I

export issquare,
    isdiagonallydominant,
    isorthogonal

function issquare(A::AbstractMatrix)::Bool
    m, n = size(A)
    m == n ? true : false
end

function isdiagonallydominant(A::AbstractMatrix)::Bool
    issquare(A) || error("Unsupported!")
    n = size(A, 1)
    B = abs.(A)
    for i in 1:n
        B[i, i] > mapreduce(j->!isequal(j, i), +, 1:n) || return false
    end
    return true
end

function isorthogonal(A::AbstractMatrix)
    issquare(A) || return false
    isapprox(A' * A, I) ? true : false
end  # function isorthogonal

end