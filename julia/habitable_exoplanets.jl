using Test

function habitable_exoplanet(L, r)
    r_i = √(L / 1.1)
    r_o = √(L / 0.54)
    r < r_i ? "too hot" : r > r_o ? "too cold" : "just right"
end

@testset "Habitable Exoplanets" begin
    @test habitable_exoplanet(1.11, 1.04) == "just right"
    @test habitable_exoplanet(1.5, 2.5) == "too cold"
end