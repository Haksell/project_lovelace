using Test

const c = 299792458

light_time(distance) = distance / c

@testset "Speed of Light" begin
    @test light_time(0) ≈ 0
    @test light_time(c) ≈ 1
    @test light_time(150_000_000_000) ≈ 500.3461427972281
end