#=
make.jl:
- Julia version: 1.0
- Author: qz
- Date: Apr 22, 2019
=#
using Documenter, APMAE4001

makedocs(
    modules=[APMAE4001],
    format=Documenter.HTML(),
    pages = [
        "Home" => "index.md",
        "Manual" => [
            "LU Factorization" => "LUFactorization/Doolittle.md",
            "Substitution" => "LUFactorization/Substitution.md"
        ]
    ],
    repo="https://github.com/singularitti/APMAE4001.jl/blob/{commit}{path}#L{line}",
    sitename="APMAE4001.jl",
    authors="Qi Zhang",
    assets=String[],
)

deploydocs(
    repo = "github.com/singularitti/APMAE4001.jl.git",
    target = "build",
    devbranch = "master",
)
