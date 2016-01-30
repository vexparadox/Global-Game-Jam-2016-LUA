scene = {}

function scene.load(file)
    return dofile(file)
end

function scene.draw(scene)
    for _, e in ipairs(scene) do
        entity.draw(e)
    end
end
