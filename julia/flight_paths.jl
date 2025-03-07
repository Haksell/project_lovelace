using Test

const R = 6372.1  # Radius of the Earth [km]

function haversine_distance(ϕ1, λ1, ϕ2, λ2)
    ϕ1, λ1, ϕ2, λ2 = map(deg2rad, (ϕ1, λ1, ϕ2, λ2))
    2R * asin(sqrt(
        sin((ϕ2 - ϕ1) / 2)^2 +
        cos(ϕ1) * cos(ϕ2) * sin((λ2 - λ1) / 2)^2
    ))
end

@testset "Flight Paths" begin
    @test haversine_distance(46.283, 86.667, -48.877, -123.393) ≈ 17760.054 atol = 1e-3
end
