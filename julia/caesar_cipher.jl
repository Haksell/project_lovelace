using Test

function caesar_cipher(ciphertext, key)
    rot_char(c) = isletter(c) ? Char(((Int8(c) - 65) + key) % 26 + 97) : c
    join(rot_char.(collect(ciphertext)))
end

function break_caesar_cipher(ciphertext, known_word)
    for key in 0:25
        plaintext = caesar_cipher(ciphertext, key)
        if occursin(known_word, plaintext)
            return plaintext
        end
    end
end

@testset "Caesar Cipher" begin
    @test break_caesar_cipher("QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD", "fox") == "the quick brown fox jumps over the lazy dog"
end