module APMAE4001

using Reexport

include("Matrices.jl")
@reexport using .Matrices

include("FiniteDifference/FiniteDifference.jl")

include("InverseMatrices/InverseMatrices.jl")
@reexport using .InverseMatrices

include("LUFactorization/LUFactorization.jl")
@reexport using .LUFactorization

end # module
