from heapq import heappop, heappush
from math import atan2, tau


def clockwise_angular_separation(p1, p2):
    x1, y1 = p1
    x2, y2 = p2
    a1 = atan2(y1, x1)
    a2 = atan2(y2, x2)
    return (a1 - a2) % tau


def length_squared(x, y):
    return x * x + y * y


def babylonian_spiral(n):
    def add_direction(d1, d2):
        new_ls = length_squared(d1, d2)
        if new_ls > ls:
            if new_ls in directions:
                directions[new_ls].append((d1, d2))
            else:
                heappush(heap, new_ls)
                directions[new_ls] = [(d1, d2)]

    directions = {2: [(1, 1)], 4: [(0, 2)]}
    heap = [2, 4]
    xs, ys = [0, 0], [0, 1]
    prev = (0, 1)

    for _ in range(n):
        ls = heappop(heap)

        candidates = []
        for d1, d2 in directions[ls]:
            candidates.extend(
                [
                    (d1, d2),
                    (d1, -d2),
                    (-d1, d2),
                    (-d1, -d2),
                    (d2, d1),
                    (d2, -d1),
                    (-d2, d1),
                    (-d2, -d1),
                ]
            )

            add_direction(d1, d2 + 1)
            if d1 != d2:
                add_direction(d1 + 1, d2)

        del directions[ls]

        dx, dy = min(
            candidates,
            key=lambda t: clockwise_angular_separation(prev, t),
        )
        xs.append(xs[-1] + dx)
        ys.append(ys[-1] + dy)
        prev = dx, dy
    return xs, ys


print(*babylonian_spiral(20), sep="\n")
