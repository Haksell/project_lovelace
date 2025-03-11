using Test

function read_periodic_table()
    io = open("periodic_table.csv")
    periodic_table = Dict()
    while !eof(io)
        element, mass = split(readline(io), ',')
        periodic_table[element] = parse(Float64, mass)
    end
    close(io)
    periodic_table
end

PERIODIC_TABLE = read_periodic_table()

function molecular_mass(chemical_formula)
    function mm(match)
        atom = match.captures[1]
        cnt = match.captures[2]
        cnt = isnothing(cnt) ? 1 : parse(UInt16, cnt)
        PERIODIC_TABLE[atom] * cnt
    end

    sum(mm, eachmatch(r"([A-Z][a-z]?)(\d+)?", chemical_formula))
end

@testset "Molecular Mass Calculator" begin
    @test molecular_mass("Pa") ≈ 231.04 atol = 1e-2
    @test molecular_mass("OCS") ≈ 60.08 atol = 1e-2
    @test molecular_mass("C4H4AsH") ≈ 128.00 atol = 1e-2
    @test molecular_mass("C20H25N3O") ≈ 323.44 atol = 1e-2
end