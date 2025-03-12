using Test

function read_mei()
    io = open("mei.ext_index.txt")
    mei = Dict()
    readline(io)
    while !eof(io)
        values = split(readline(io), '\t')
        year = parse(Int16, values[1])
        scores = parse.(Float64, values[2:end])
        mei[year] = (min(scores...), max(scores...))
    end
    close(io)
    mei
end

MEI = read_mei()

function enso_classification(year)
    min_score, max_score = MEI[year]
    if min_score > -0.5 && max_score < 0.5
        return ("Neither", "none")
    end
    classification, absolute = if max_score > -min_score
        "El Nino", max_score
    else
        "La Nina", -min_score
    end
    strength = absolute >= 2 ? "very strong" :
               absolute >= 1.5 ? "strong" :
               absolute >= 1 ? "moderate" :
               "weak"
    classification, strength
end

@testset "El Niño intensities" begin
    @test enso_classification(1894) == ("La Nina", "strong")
    @test enso_classification(1955) == ("La Nina", "very strong")
    @test enso_classification(1996) == ("Neither", "none")
    @test enso_classification(2016) == ("El Nino", "very strong")
end