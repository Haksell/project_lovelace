using Test

fac = factorial ∘ big

function bernoulli(n)
    if n == 0
        return (1, 1)
    end
    b = ones(Rational{BigInt}, n + 1)
    b[2] = -1 // 2
    for i in 2:n
        b[i+1] = -sum(
            fac(i) * b[k+1] / fac(i + 1 - k) / fac(k)
            for k in 0:i-1
        )
    end
    numerator(b[end]), denominator(b[end])
end

@testset "Ada Lovelace's Note G" begin
    @test bernoulli(0) == (1, 1)
    @test bernoulli(1) == (-1, 2)
    @test bernoulli(2) == (1, 6)
    @test bernoulli(3) == (0, 1)
    @test bernoulli(4) == (-1, 30)
    @test bernoulli(5) == (0, 1)
    @test bernoulli(6) == (1, 42)
    @test bernoulli(7) == (0, 1)
    @test bernoulli(8) == (-1, 30)
    @test bernoulli(88) == (
        -1311426488674017507995511424019311843345750275572028644296919890574047,
        61410,
    )
end