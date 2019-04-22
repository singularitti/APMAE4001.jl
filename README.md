# APMAE4001.jl

This is the repo containing numerical algorithms I implement when studying the course [APMA E4001](https://vergil.registrar.columbia.edu/#/courses/APMAE4001_001_2019_1).

Current directory structure:

```plain
.
├── LICENSE
├── Manifest.toml
├── Project.toml
├── README.md
├── REQUIRE
├── _init.jl
├── docs
│   ├── make.jl
│   └── src
├── src
│   ├── APMAE4001.jl
│   ├── FiniteDifference
│   │   └── FiniteDifference.jl
│   ├── InverseMatrices
│   │   └── InverseMatrices.jl
│   ├── LUFactorization
│   │   ├── Doolittle.jl
│   │   ├── LUFactorization.jl
│   │   ├── LUP.jl
│   │   └── Substitution.jl
│   └── Matrix.jl
└── test
    ├── TestDoolittle.jl
    ├── TestInverseMatrices.jl
    └── runtests.jl
```
