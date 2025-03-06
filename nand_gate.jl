using Test

NAND(a, b) = ~(a & b) & 1

@testset "Nand Gate" begin
    @test NAND(0, 0) == 1
    @test NAND(0, 1) == 1
    @test NAND(1, 0) == 1
    @test NAND(1, 1) == 0
end