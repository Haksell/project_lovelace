using Test

compound_interest(amount, rate, years) = amount * (1 + rate)^years

@testset "Compound Interest" begin
    @test compound_interest(1000, 0.07, 25) ≈ 5427.43 atol = 0.01
end