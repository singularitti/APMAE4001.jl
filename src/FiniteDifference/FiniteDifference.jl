"""
# module FiniteDifference



# Examples

```jldoctest
julia>
```
"""
module FiniteDifference

using BandedMatrices

export forward_difference_matrix,
    backward_difference_matrix,
    cyclic_difference_matrix,
    centered_difference_matrix

"""
    forward_difference_matrix(T::Type{<:Number}, shape::NTuple{N,<:Number})

Create a forward difference matrix.

The default type of returned value `A` is a `BandedMatrix`.
If you want a regular `Matrix`, run `Matrix(A)`.
"""
function forward_difference_matrix(T::Type{<:Number}, shape::NTuple{N,<:Number}) where {N}
    A = BandedMatrix(-Ones{T}(shape), (0, 1))
    A[band(1)] .= 1
    return A
end

"""
    backward_difference_matrix(T::Type{<:Number}, shape::NTuple{N,<:Number})

Create a backward difference matrix.

The default type of returned value `A` is a `BandedMatrix`.
If you want a regular `Matrix`, run `Matrix(A)`.
"""
function backward_difference_matrix(T::Type{<:Number}, shape::NTuple{N,<:Number}) where {N}  # I am unsure about this construction.
    A = BandedMatrix(Ones{T}(shape), (1, 0))
    A[band(-1)] .= -1
    return A
end

function cyclic_difference_matrix(T::Type{<:Number}, shape::NTuple{N,<:Number}) where {N}
    A = BandedMatrix(Ones{T}(shape), (1, 0))
    A[band(-1)] .= -1
    B = Matrix(A)
    B[1, end] = -1
    return B
end

function centered_difference_matrix(T::Type{<:Number}, shape::NTuple{N,<:Number}) where {N}
    A = BandedMatrix(Zeros{T}(shape), (1, 1))
    A[band(-1)] .= -1
    A[band(1)] .= 1
    return A
end

end