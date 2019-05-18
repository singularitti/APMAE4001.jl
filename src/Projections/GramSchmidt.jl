"""
# module GramSchmidt



# Examples

```jldoctest
julia>
```
"""
module GramSchmidt

using LinearAlgebra: norm, normalize

using APMAE4001.Tools: deepflatten

export project_onto_vector,
    gram_schmidt

function project_onto_vector(a::Vector, b::Vector)
    a * a' * b / norm(a)^2
end  # function project_onto_vector

function gram_schmidt(A; normalized::Bool = true, matrix_form::Bool = true)
    raw = [A[1]]
    for i in 2:length(A)
        push!(raw, A[i] - sum(project_onto_vector(A[j], A[i]) for j in 1:(i - 1)))
    end
    x = (normalized ? map(normalize, raw) : raw)
    matrix_form ? deepflatten(x) : x
end  # function gram_schmidt

end