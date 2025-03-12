using Test

const v = 6.0  # velocity of seismic waves [km/s]

# https://math.stackexchange.com/a/1033561
function intersection_two_circles(x1, y1, r1, x2, y2, r2)
    d = hypot(x1 - x2, y1 - y2)
    l = (r1^2 - r2^2 + d^2) / 2d
    h = √(r1^2 - l^2)
    x_same = (l * (x2 - x1) / d) + x1
    x_diff = h * (y2 - y1) / d
    y_same = (l * (y2 - y1) / d) + y1
    y_diff = h * (x2 - x1) / d
    (x_same + x_diff, y_same - y_diff), (x_same - x_diff, y_same + y_diff)
end

function earthquake_epicenter(x1, y1, t1, x2, y2, t2, x3, y3, t3)
    r1 = t1 * v
    r2 = t2 * v
    r3 = t3 * v
    (xa, ya), (xb, yb) = intersection_two_circles(x1, y1, r1, x2, y2, r2)
    ra = hypot(x3 - xa, y3 - ya)
    rb = hypot(x3 - xb, y3 - yb)
    abs(ra - r3) < abs(rb - r3) ? (xa, ya) : (xb, yb)
end

@testset "Earthquake Epicenters" begin
    x0, y0 = earthquake_epicenter(
        8.382353226,
        -58.003720814,
        12.860754193,
        -13.590571819,
        73.976069096,
        22.847488548,
        77.291172370,
        7.508764456,
        5.767809783
    )
    @test x0 ≈ 79.06746127
    @test y0 ≈ -27.05247781
end
