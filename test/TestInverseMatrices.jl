#=
TestInverseMatrices.jl:
- Julia version: 1.0
- Author: qz
- Date: Apr 22, 2019
=#
module TestInverseMatrices

using LinearAlgebra
using Test

using APMAE4001.InverseMatrices

@testset "test 1" begin
    x = Diagonal([1, 2.0, 0.001])
    @test inverse(x) == inv(x)
end

end
