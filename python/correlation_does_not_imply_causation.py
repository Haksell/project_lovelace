import numpy as np


def correlation_coefficient(x, y):
    return np.corrcoef(x, y)[0, 1]


def test_survive():
    x = [5427, 5688, 6198, 6462, 6635, 7336, 7248, 7491, 8161, 8578, 9000]
    y = [
        18.079,
        18.594,
        19.753,
        20.734,
        20.831,
        23.029,
        23.597,
        23.584,
        22.525,
        27.731,
        29.449,
    ]
    assert abs(correlation_coefficient(x, y) - 0.94684375) < 1e-6
