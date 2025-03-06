using Test

fahrenheit_to_celsius(f) = (f - 32) * 5 / 9

@testset "Temperature Conversion Tests" begin
    @test fahrenheit_to_celsius(-40) ≈ -40
    @test fahrenheit_to_celsius(32) ≈ 0
    @test fahrenheit_to_celsius(98.6) ≈ 37
    @test fahrenheit_to_celsius(212) ≈ 100
end