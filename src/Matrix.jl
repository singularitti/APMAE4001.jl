"""
# module Matrix



# Examples

```jldoctest
julia>
```
"""
module Matrix

export issquare

function issquare(A::AbstractMatrix)::Bool
    m, n = size(A)
    m == n ? true : false
end

end