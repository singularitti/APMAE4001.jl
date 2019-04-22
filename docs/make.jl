#=
make.jl:
- Julia version: 1.0
- Author: qz
- Date: Apr 22, 2019
=#
using Documenter, APMAE4001

makedocs(sitename = "APMAE4001",
    pages = [
        "Home" => "index.md",
        "Manual" => [
            "LU Factorization" => "LUFactorization/Doolittle.md",
            "Substitution" => "LUFactorization/Substitution.md"
        ]
    ],
)

deploydocs(
    repo = "github.com/singularitti/APMAE4001.jl.git",
    target = "build",
    devbranch = "develop",
)
