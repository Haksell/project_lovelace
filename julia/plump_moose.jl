using Test

const a = 2.757
const b = 16.793

moose_body_mass(latitude) = a * latitude + b

@testset "Plump Moose" begin
    @test moose_body_mass(0) ≈ b
    @test moose_body_mass(60.5) ≈ 183.5915
end