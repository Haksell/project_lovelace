using Test

function wind_chill(t, v)
    v016 = v^0.16
    13.12 + 0.6215t - 11.37v016 + 0.3965(t * v016)
end

@testset "Wind Chill" begin
    @test wind_chill(-25, 30) ≈ -39.09 atol = 0.01
end