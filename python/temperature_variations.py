from statistics import mean, pstdev


def temperature_statistics(t):
    return mean(t), pstdev(t)


def test_temperature_statistics():
    m, s = temperature_statistics(
        [4.4, 4.2, 7.0, 12.9, 18.5, 23.5, 26.4, 26.3, 22.5, 16.6, 11.2, 7.3]
    )
    assert abs(m - 15.067) < 1e-3
    assert abs(s - 8.021) < 1e-3
