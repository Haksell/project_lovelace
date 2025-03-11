using Test

rna(dna) = reverse(replace(dna, 'T' => 'U'))

@testset "DNA Transcription" begin
    @test rna("CCTAGGACCAGGTT") == "UUGGACCAGGAUCC"
end