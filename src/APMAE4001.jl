module APMAE4001

using Reexport

include("Matrix.jl")
@reexport using .Matrix

include("FiniteDifference/FiniteDifference.jl")

include("LUFactorization/LUFactorization.jl")
@reexport using .LUFactorization

end # module
