def area_of_rectangles(rects, dx):
    return sum(rects) * dx


def test_temperature_statistics():
    assert area_of_rectangles([0, 1, 2, 3, 4, 5], 1.5) == 22.5
    assert area_of_rectangles([-1, 2, -3, 4, -5], 2) == -6
