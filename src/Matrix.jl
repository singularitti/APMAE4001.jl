"""
# module Matrix



# Examples

```jldoctest
julia>
```
"""
module Matrix

export issquare

function issquare(a::AbstractMatrix)::Bool
    m, n = size(a)
    m == n ? true : false
end

end