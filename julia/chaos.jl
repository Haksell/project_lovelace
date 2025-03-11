using Test

SIZE = 51

function logistic_map(r)
    x = fill(0.5, SIZE)
    for i in 2:SIZE
        x[i] = r * x[i-1] * (1 - x[i-1])
    end
    x
end

@testset "Chaos" begin
    @test logistic_map(2.81)[begin:10] ≈ [
        0.5,
        0.7025,
        0.5872724375,
        0.6810976958443922,
        0.6103421850131843,
        0.6682871322003106,
        0.6229192295915845,
        0.6600433250204778,
        0.6305250368670551,
        0.6546266334498996
    ]
    @test logistic_map(2) == fill(0.5, SIZE)
end