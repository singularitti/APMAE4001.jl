using APMAE4001
using Test

@testset "APMAE4001.jl" begin
    include("TestDoolittle.jl")
    include("TestInverseMatrices.jl")
end
