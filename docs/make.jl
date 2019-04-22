#=
make.jl:
- Julia version: 1.0
- Author: qz
- Date: Apr 22, 2019
=#
using Documenter, APMAE4001

makedocs(sitename="APMAE4001 Documentation")

deploydocs(
    repo = "github.com/singularitti/APMAE4001.jl.git",
)
