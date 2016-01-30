camera = {
    x = 0,
    y = 0
}

function camera.draw(scene)
    table.sort(scene, function (a, b)
        return a.z < b.z or a.y < b.y
    end)

    love.graphics.push()
    love.graphics.translate(camera.x, camera.y)
    for _, e in ipairs(scene) do
        entity.draw(e)
    end
    love.graphics.pop()
end
