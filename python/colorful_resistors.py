DIGITS = {
    "black": 0,
    "brown": 1,
    "red": 2,
    "orange": 3,
    "yellow": 4,
    "green": 5,
    "blue": 6,
    "violet": 7,
    "grey": 8,
    "white": 9,
}

MULTIPLIER = {
    "pink": 0.001,
    "silver": 0.01,
    "gold": 0.1,
    "black": 1,
    "brown": 10,
    "red": 100,
    "orange": 10**3,
    "yellow": 10**4,
    "green": 10**5,
    "blue": 10**6,
    "violet": 10**7,
    "grey": 10**8,
    "white": 10**9,
}

TOLERANCE = {
    "none": 0.2,
    "silver": 0.1,
    "gold": 0.05,
    "brown": 0.01,
    "red": 0.02,
    "green": 0.005,
    "blue": 0.0025,
    "violet": 0.001,
    "grey": 0.0005,
}


def resistance(band_colors):
    if len(band_colors) == 1:
        return 0, 0, 0
    elif len(band_colors) in (4, 5):
        *digits, multiplier, tolerance = band_colors
        r = 0
        for d in digits:
            r = 10 * r + DIGITS[d]
        r *= MULTIPLIER[multiplier]
        t = TOLERANCE[tolerance]
        return (r, r * (1 - t), r * (1 + t))


def test_resistance():
    assert resistance(["green", "blue", "yellow", "gold"]) == (
        560_000,
        532_000,
        588_000,
    )
    assert resistance(["red", "orange", "violet", "black", "brown"]) == (
        237.00,
        234.63,
        239.37,
    )
