import Base: isempty, pop!, push!

############
# Min-Heap #
############

struct MinHeap{T}
    data::Vector{T}
end

function MinHeap{T}() where {T}
    MinHeap{T}(Vector{T}())
end

isempty(h::MinHeap) = isempty(h.data)

function push!(h::MinHeap{T}, val::T) where {T}
    push!(h.data, val)
    i = length(h.data)
    parent(i) = i ÷ 2
    while i > 1
        p = parent(i)
        if h.data[i] < h.data[p]
            h.data[i], h.data[p] = h.data[p], h.data[i]
            i = p
        else
            break
        end
    end
end

function pop!(h::MinHeap)
    @assert !isempty(h) "Attempting to pop! from an empty heap"
    data = h.data
    data[1], data[end] = data[end], data[1]
    val = pop!(data)
    n = length(data)
    i = 1
    leftchild(i) = 2 * i
    rightchild(i) = 2 * i + 1

    while true
        l = leftchild(i)
        r = rightchild(i)
        if l > n
            break
        elseif r > n
            c = l
        else
            c = data[l] < data[r] ? l : r
        end

        if data[c] < data[i]
            data[i], data[c] = data[c], data[i]
            i = c
        else
            break
        end
    end

    val
end

#####################
# Babylonian spiral #
#####################

function clockwise_angular_separation(p1, p2)
    x1, y1 = p1
    x2, y2 = p2
    a1 = atan(y1, x1)
    a2 = atan(y2, x2)
    mod(a1 - a2, 2π)
end

length_squared(x, y) = x * x + y * y

function babylonian_spiral(n)
    directions = Dict{Int,Vector{Tuple{Int,Int}}}(
        2 => [(1, 1)],
        4 => [(0, 2)]
    )
    heap = MinHeap{Int}()
    push!(heap, 2)
    push!(heap, 4)
    xs = [0, 0]
    ys = [0, 1]
    prev = (0, 1)

    function add_direction(d1::Int, d2::Int, current_ls::Int)
        new_ls = length_squared(d1, d2)
        if new_ls > current_ls
            if haskey(directions, new_ls)
                push!(directions[new_ls], (d1, d2))
            else
                directions[new_ls] = [(d1, d2)]
                push!(heap, new_ls)
            end
        end
    end

    for _ in 1:n
        ls = pop!(heap)

        candidates = Tuple{Int,Int}[]
        for (d1, d2) in directions[ls]
            append!(candidates, [
                (d1, d2), (d1, -d2),
                (-d1, d2), (-d1, -d2),
                (d2, d1), (d2, -d1),
                (-d2, d1), (-d2, -d1)
            ])

            add_direction(d1, d2 + 1, ls)
            if d1 != d2
                add_direction(d1 + 1, d2, ls)
            end
        end

        delete!(directions, ls)

        idx = argmin([clockwise_angular_separation(prev, c) for c in candidates])
        dx, dy = candidates[idx]

        push!(xs, xs[end] + dx)
        push!(ys, ys[end] + dy)

        prev = (dx, dy)
    end

    xs, ys
end

xs, ys = babylonian_spiral(20)
println(xs)
println(ys)
