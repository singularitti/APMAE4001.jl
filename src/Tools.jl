"""
# module Tools



# Examples

```jldoctest
julia>
```
"""
module Tools

export deepflatten

function deepflatten(arr::Vector{<: Vector})
    dim = [1]

    function recursiveflatten(arr, dim)
        if arr isa Vector{<: Vector}
            recursiveflatten(collect(Iterators.flatten(arr)),
                pushfirst!(dim, length(arr) / prod(dim)))
        else
            arr, pushfirst!(dim, length(arr) / prod(dim))
        end
    end

    flattened, dim = recursiveflatten(arr, dim)
    reshape(flattened, dim[1:end - 1]...)
end

end