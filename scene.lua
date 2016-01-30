scene = {}

function scene.load(path)
    local s, h, v = dofile(path)
    return s, h, v
end

-- TODO: use less appends to save on creating temp strings
function scene.write(scene, horizontal, vertical, path)
    local data = "return {\n"

    -- entities
    for _, e in ipairs(scene) do
        data = data .. "{ "
        data = data .. "name = '" .. e.name .. "', "
        data = data .. "x = " .. e.x .. ", "
        data = data .. "y = " .. e.y .. ", "
        data = data .. "z = " .. e.z .. ", "
        data = data .. " },\n"
    end

    data = data .. "}, {\n"

    -- horizontal collision
    for _, e in ipairs(horizontal) do
        data = data .. "{ "
        data = data .. "x1 = " .. e.x1 .. ", "
        data = data .. "y1 = " .. e.y1 .. ", "
        data = data .. "x2 = " .. e.x2 .. ", "
        data = data .. "y2 = " .. e.y2 .. ", "
        data = data .. " },\n"
    end

    data = data .. "}, {\n"

    -- vertical collision
    for _, e in ipairs(vertical) do
        data = data .. "{ "
        data = data .. "x1 = " .. e.x1 .. ", "
        data = data .. "y1 = " .. e.y1 .. ", "
        data = data .. "x2 = " .. e.x2 .. ", "
        data = data .. "y2 = " .. e.y2 .. ", "
        data = data .. " },\n"
    end

    data = data .. "}"

    love.filesystem.write(path, data)
end
