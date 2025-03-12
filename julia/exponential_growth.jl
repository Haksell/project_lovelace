using Test

function exponential_growth(x0, k, dt, N)
    x = zeros(N + 1)
    x[1] = x0
    for i in 1:N
        x[i+1] = x[i] * (1 + k * dt)
    end
    x
end

@testset "Exponential Growth" begin
    @test exponential_growth(5, 1, 0.6, 3) ≈ [5, 8, 12.8, 20.48] atol = 1e-2
    @test exponential_growth(1, 2.5, 0.1, 5) ≈
          [1, 1.25, 1.5625, 1.953125, 2.44140625, 3.0517578125] atol = 1e-2
end