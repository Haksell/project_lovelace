using Test

const v_e = 2_550  # rocket exhaust velocity [m/s]
const M = 250_000  # rocket dry mass [kg]

rocket_fuel(v) = M * (exp(v / v_e) - 1)

@testset "Rocket Science" begin
    @test rocket_fuel(11186) ≈ 19843016.2
    @test rocket_fuel(500) ≈ 54155.58
end