scene = {}

function scene.load(path)
    return dofile(path)
end

-- TODO: use less appends to save on creating temp strings
function scene.write(scene, path)
    local data = "return {\n"

    for _, e in ipairs(scene) do
        data = data .. "{ "
        data = data .. "name = '" .. e.name .. "', "
        data = data .. "x = " .. e.x .. ", "
        data = data .. "y = " .. e.y .. ", "
        data = data .. "z = " .. e.z .. ", "
        data = data .. " },\n"
    end

    data = data .. "}"

    love.filesystem.write(path, data)
end
