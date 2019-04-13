"""
# module TestDoolittle



# Examples

```jldoctest
julia>
```
"""
module TestDoolittle

using Test

using APMAE4001.LUFactorization.Doolittle

@testset "Set 1" begin
     A = [1  1  0  0  0  0
          1  2  1  0  0  0
          0  1  2  1  0  0
          0  0  1  2  1  0
          0  0  0  1  2  1
          0  0  0  0  1  2]
     L, U = doolittle_lu(A)
     @test L == [1.0  0.0  0.0  0.0  0.0  0.0
                 1.0  1.0  0.0  0.0  0.0  0.0
                 0.0  1.0  1.0  0.0  0.0  0.0
                 0.0  0.0  1.0  1.0  0.0  0.0
                 0.0  0.0  0.0  1.0  1.0  0.0
                 0.0  0.0  0.0  0.0  1.0  1.0]
     @test U == [1.0  1.0  0.0  0.0  0.0  0.0
                 0.0  1.0  1.0  0.0  0.0  0.0
                 0.0  0.0  1.0  1.0  0.0  0.0
                 0.0  0.0  0.0  1.0  1.0  0.0
                 0.0  0.0  0.0  0.0  1.0  1.0
                 0.0  0.0  0.0  0.0  0.0  1.0]
end

@testset "Example from notes" begin
     A = [1  1   0
          2  5   1
          1  4  -1]
     b = [1, 1, 2]
     L, U = doolittle_lu(A)
     @test L == [1.0  0.0  0.0
                 2.0  1.0  0.0
                 1.0  1.0  1.0]
     @test U == [1.0  1.0   0.0
                 0.0  3.0   1.0
                 0.0  0.0  -2.0]
     solutions = polysolve(A, b)
     @test solutions == A \ b
end

end