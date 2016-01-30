collision = {}

function collision.test(px, py, x1, y1, x2, y2)
    return px > x1 and
           px < x2 and
           py > y1 and
           py < y2
end

function collision.checkhorizontal(e, lines, dx)
    for _, line in ipairs(lines) do
        if dx > line.x and e.x < line.x then
            dx = line.x
        end
        return dx
    end
end

function collision.checkvertical(e, lines, dy)
    for _, line in ipairs(lines) do
        if dy > line.y and e.y < line.y then
            dy = line.y
        end
        return dy
    end
end
