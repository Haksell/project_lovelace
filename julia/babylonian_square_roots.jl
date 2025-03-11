using Test

function babylonian_sqrt(s)
    if s <= 1
        return s
    end
    x = 1
    for _ in 1:32
        x = (x + (s / x)) / 2
    end
    x
end

@testset "Babylonian Square Roots" begin
    @test babylonian_sqrt(0) ≈ 0 atol = 1e-10
    @test babylonian_sqrt(1) ≈ 1 atol = 1e-10
    @test babylonian_sqrt(2) ≈ 1.4142135623730951 atol = 1e-10
    @test babylonian_sqrt(3) ≈ 1.7320508075688772 atol = 1e-10
    @test babylonian_sqrt(4) ≈ 2 atol = 1e-10
    @test babylonian_sqrt(5) ≈ 2.23606797749979 atol = 1e-10
    @test babylonian_sqrt(420) ≈ 20.493901531919196 atol = 1e-10
end