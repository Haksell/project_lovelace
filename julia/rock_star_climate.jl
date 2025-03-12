using Test

σ = 5.670374419e-8

rock_temperature(S, a, e) = √√((1 - a) * S / (4 * e * σ)) - 273.15

@testset "Rock Star Climate" begin
    @test rock_temperature(1361, 0.306, 0.612) ≈ 14.059374 atol = 1e-6
end