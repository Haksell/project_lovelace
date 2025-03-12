using Test

const STOP_CODON = "Stop"

const CODONS = Dict{NTuple{3,Char},String}(
    ('A', 'A', 'A') => "Lys",
    ('A', 'A', 'C') => "Asn",
    ('A', 'A', 'G') => "Lys",
    ('A', 'A', 'U') => "Asn",
    ('A', 'C', 'A') => "Thr",
    ('A', 'C', 'C') => "Thr",
    ('A', 'C', 'G') => "Thr",
    ('A', 'C', 'U') => "Thr",
    ('A', 'G', 'A') => "Arg",
    ('A', 'G', 'C') => "Ser",
    ('A', 'G', 'G') => "Arg",
    ('A', 'G', 'U') => "Ser",
    ('A', 'U', 'A') => "Ile",
    ('A', 'U', 'C') => "Ile",
    ('A', 'U', 'G') => "Met",
    ('A', 'U', 'U') => "Ile",
    ('C', 'A', 'A') => "Gln",
    ('C', 'A', 'C') => "His",
    ('C', 'A', 'G') => "Gln",
    ('C', 'A', 'U') => "His",
    ('C', 'C', 'A') => "Pro",
    ('C', 'C', 'C') => "Pro",
    ('C', 'C', 'G') => "Pro",
    ('C', 'C', 'U') => "Pro",
    ('C', 'G', 'A') => "Arg",
    ('C', 'G', 'C') => "Arg",
    ('C', 'G', 'G') => "Arg",
    ('C', 'G', 'U') => "Arg",
    ('C', 'U', 'A') => "Leu",
    ('C', 'U', 'C') => "Leu",
    ('C', 'U', 'G') => "Leu",
    ('C', 'U', 'U') => "Leu",
    ('G', 'A', 'A') => "Glu",
    ('G', 'A', 'C') => "Asp",
    ('G', 'A', 'G') => "Glu",
    ('G', 'A', 'U') => "Asp",
    ('G', 'C', 'A') => "Ala",
    ('G', 'C', 'C') => "Ala",
    ('G', 'C', 'G') => "Ala",
    ('G', 'C', 'U') => "Ala",
    ('G', 'G', 'A') => "Gly",
    ('G', 'G', 'C') => "Gly",
    ('G', 'G', 'G') => "Gly",
    ('G', 'G', 'U') => "Gly",
    ('G', 'U', 'A') => "Val",
    ('G', 'U', 'C') => "Val",
    ('G', 'U', 'G') => "Val",
    ('G', 'U', 'U') => "Val",
    ('U', 'A', 'A') => STOP_CODON,
    ('U', 'A', 'C') => "Tyr",
    ('U', 'A', 'G') => STOP_CODON,
    ('U', 'A', 'U') => "Tyr",
    ('U', 'C', 'A') => "Ser",
    ('U', 'C', 'C') => "Ser",
    ('U', 'C', 'G') => "Ser",
    ('U', 'C', 'U') => "Ser",
    ('U', 'G', 'A') => STOP_CODON,
    ('U', 'G', 'C') => "Cys",
    ('U', 'G', 'G') => "Trp",
    ('U', 'G', 'U') => "Cys",
    ('U', 'U', 'A') => "Leu",
    ('U', 'U', 'C') => "Phe",
    ('U', 'U', 'G') => "Leu",
    ('U', 'U', 'U') => "Phe",
)

function amino_acid_sequence(rna::String)
    amino_acids = String[]

    for i in 1:3:length(rna)
        triplet = (rna[i], rna[i+1], rna[i+2])
        aa = CODONS[triplet]
        if aa == STOP_CODON
            break
        end
        push!(amino_acids, aa)
    end

    join(amino_acids, "")
end


@testset "RNA Translation" begin
    @test amino_acid_sequence("CCU") == "Pro"
    @test amino_acid_sequence("AUGCCAAAGGGUUGA") == "MetProLysGly"
    @test amino_acid_sequence("GCAAGAGAUAAUUGU") == "AlaArgAspAsnCys"
end