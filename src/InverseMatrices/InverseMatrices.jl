"""
# module InverseMatrices



# Examples

```jldoctest
julia>
```
"""
module InverseMatrices

using LinearAlgebra

export inverse

function inverse(m::Diagonal)  # Note 6 in Section 2.5.
    diagonals = diag(m)
    iszero(diagonals) ? error("Not supported!") : Diagonal(1 ./ diagonals)
end

end
