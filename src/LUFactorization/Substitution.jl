"""
# module Substitution



# Examples

```jldoctest
julia>
```
"""
module Substitution

using LinearAlgebra: rank, UpperTriangular, LowerTriangular

using SimpleTraits: @traitdef, @traitimpl, @traitfn

export Forward,
    Backward,
    substitution

struct Forward end
struct Backward end

substitution(A::UpperTriangular, b::AbstractVector) = substitution(Backward(), A, b)
substitution(A::LowerTriangular, b::AbstractVector) = substitution(Forward(), A, b)
function substitution(::Backward, A::AbstractMatrix, b::AbstractVector)
    m, n = size(A)
    r = rank(A)
    for i in m:1
        for j in n:1
            (b[i] - sum() ) / A[i, j]
        end
    end
end
function substitution(::Forward, A::AbstractMatrix, b::AbstractVector)
    m, n = size(A)
    r = rank(A)
    for i in m:1
        for j in n:1
            (b[i] - sum() ) / A[i, j]
        end
    end
end

end