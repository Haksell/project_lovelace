using Test

almost_pi(n) = 4 * sum(k -> (-1)^k / (2k + 1), 0:n-1)

@testset "Almost π" begin
    @test almost_pi(25) ≈ 3.1815766854350325
    @test almost_pi(10000) ≈ 3.1414926535900345
end